use std::sync::{Arc, Mutex};
use event::*;

use flutter_rust_bridge::frb;
use futures::executor::block_on;
use mlua::prelude::*;
use state::LuauStateUserData;

use super::plugin::*;

pub mod event;
pub mod state;

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
        source: Channel,
        target: Channel,
    ) -> EventResult {
        let server_event: JsonObject = serde_json::from_str(&server_event).unwrap();
        let details = EventDetails::new(server_event, target, source, None);
        let lua_value = self.engine.lock().unwrap().to_value(&details).unwrap();
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
            .set("Events", LuauEventSystemUserData(Arc::clone(&event_system), callback.clone()))
            .unwrap();
        engine.globals().set("State", LuauStateUserData(callback)).unwrap();

        let engine = Arc::new(Mutex::new(engine));
        Self {
            engine,
            code,
            event_system,
        }
    }
}
