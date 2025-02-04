use std::{
    collections::HashMap,
    sync::{Arc, Mutex},
};

use flutter_rust_bridge::frb;
use futures::executor::block_on;
use mlua::prelude::*;

use super::plugin::*;

impl PluginCallback {
    fn construct_on_print(&self, engine: &Lua) -> LuaResult<LuaFunction> {
        let on_print = self.on_print.clone();
        engine.create_function(move |_, s: String| {
            block_on(on_print(s));
            Ok(())
        })
    }

    fn construct_globals(&self, engine: &Lua) -> LuaResult<()> {
        engine
            .globals()
            .set("print", self.construct_on_print(engine)?)?;
        Ok(())
    }
}

#[derive(Default)]
#[frb(ignore)]
pub struct LuauEventSystem {
    event_handlers: HashMap<String, Vec<(u64, LuaFunction)>>,
    next_id: u64,
}

impl LuauEventSystem {
    /// Führt alle Handler des angegebenen Events mit den übergebenen Argumenten aus.
    fn run_event_handler(&self, event: &str, args: impl IntoLuaMulti + Clone) {
        if let Some(handlers) = self.event_handlers.get(event) {
            for (_, handler) in handlers {
                // Fehler werden hier aus Vereinfachungsgründen ignoriert.
                let _ = handler.call::<()>(args.clone());
            }
        }
    }
}

/// Dieses UserData-Wrapper ermöglicht den Zugriff aus Lua über die globale Variable `event`.
/// Beim Indexieren mit einem Event-Namen (z. B. `event.UserJoined`) wird ein Table mit den
/// Methoden `Connect` und `Fire` zurückgegeben.
struct LuauEventSystemUserData(Arc<Mutex<LuauEventSystem>>, PluginCallback);

impl LuaUserData for LuauEventSystemUserData {
    fn add_methods<M: mlua::UserDataMethods<Self>>(methods: &mut M) {
        // Beim Zugriff über event["EventName"] wird diese Metamethode aufgerufen.
        methods.add_meta_method(LuaMetaMethod::Index, |lua, this, key: String| {
            let event_system = Arc::clone(&this.0);
            let event_name = key.clone();

            // Erzeuge einen Table, der für das spezifische Event die Methoden Connect und Fire bereitstellt.
            let tbl = lua.create_table()?;

            // --- Connect ---
            // Registriert einen Handler und liefert ein Connection-Objekt zurück.
            let connect_fn = {
                let event_system = Arc::clone(&event_system);
                let event_name = event_name.clone();
                lua.create_function(move |lua_ctx, handler: LuaFunction| {
                    let mut system = event_system.lock().unwrap();
                    let handler_id = system.next_id;
                    system.next_id += 1;
                    system
                        .event_handlers
                        .entry(event_name.clone())
                        .or_insert_with(Vec::new)
                        .push((handler_id, handler.clone()));

                    // Erzeuge das Connection-Objekt, das in Lua zur Verfügung steht.
                    let connection = LuauEventConnection {
                        event_system: Arc::clone(&event_system),
                        event_name: event_name.clone(),
                        handler_id,
                    };
                    lua_ctx.create_userdata(connection)
                })?
            };
            tbl.set("Connect", connect_fn)?;

            Ok(tbl)
        });
        methods.add_method("Process", |_, this, (event, force): (LuaTable, Option<bool>)| {
            let serialized_event = serde_json::to_string(&event).unwrap();
            let process_event = this.1.process_event.clone();
            let _ = process_event(serialized_event, force);
            Ok(())
        });
        methods.add_method("Send", |_, this, (event, target): (LuaTable, Option<Channel>)| {
            let serialized_event = serde_json::to_string(&event).unwrap();
            let send_event = this.1.send_event.clone();
            let _ = send_event(serialized_event, target);
            Ok(())
        });
    }
}

/// Das Connection-Objekt wird beim Registrieren eines Handlers zurückgegeben und ermöglicht
/// über die Methode `Disconnect` das spätere Abmelden.
pub struct LuauEventConnection {
    event_system: Arc<Mutex<LuauEventSystem>>,
    event_name: String,
    handler_id: u64,
}

impl LuaUserData for LuauEventConnection {
    fn add_methods<M: mlua::UserDataMethods<Self>>(methods: &mut M) {
        methods.add_method("Disconnect", |_, this, ()| {
            let mut system = this.event_system.lock().unwrap();
            if let Some(handlers) = system.event_handlers.get_mut(&this.event_name) {
                handlers.retain(|(id, _)| *id != this.handler_id);
            }
            Ok(())
        });
    }
}

pub struct LuauPlugin {
    engine: Arc<Mutex<Lua>>,
    code: String,
    event_system: Arc<Mutex<LuauEventSystem>>,
}

impl RustPlugin for LuauPlugin {
    fn run_event(
        &self,
        event_type: String,
        event: String,
        server_event: String,
        target: Channel,
    ) -> EventResult {
        let server_event: JsonObject = serde_json::from_str(&server_event).unwrap();
        let details = EventDetails::new(server_event, target, 0, None);
        let lua_value = self.engine.lock().unwrap().to_value(&details).unwrap();
        // Event-Handler ausführen (hier aufgerufen von Rust aus).
        self.event_system
            .lock()
            .unwrap()
            .run_event_handler(&event_type, (event, &lua_value));
        let details: EventDetails = self.engine.lock().unwrap().from_value(lua_value).unwrap();
        EventResult::from(details)
    }

    fn run(&self) -> anyhow::Result<()> {
        let engine = self.engine.lock().unwrap();
        engine.load(&self.code).exec()?;
        Ok(())
    }
}

impl LuauPlugin {
    #[frb(sync)]
    pub fn new(code: String, callback: PluginCallback) -> LuauPlugin {
        let engine = Lua::new();
        engine.sandbox(true).unwrap();
        callback.construct_globals(&engine).unwrap();
        let event_system = LuauEventSystem::default();
        let event_system = Arc::new(Mutex::new(event_system));
        engine
            .globals()
            .set("event", LuauEventSystemUserData(Arc::clone(&event_system), callback))
            .unwrap();

        let engine = Arc::new(Mutex::new(engine));
        Self {
            engine,
            code,
            event_system,
        }
    }
}
