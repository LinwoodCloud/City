use crate::api::plugin::Channel;
use std::{collections::HashMap, sync::{Arc, Mutex}};

use flutter_rust_bridge::frb;
use mlua::prelude::*;

use crate::api::plugin::PluginCallback;

#[derive(Default)]
#[frb(ignore)]
pub(crate) struct LuauEventSystem {
    event_handlers: HashMap<String, Vec<(u64, LuaFunction)>>,
    next_id: u64,
}

impl LuauEventSystem {
    pub(crate) fn run_event_handler(&self, event: &str, args: impl IntoLuaMulti + Clone) {
        if let Some(handlers) = self.event_handlers.get(event) {
            for (_, handler) in handlers {
                let _ = handler.call::<()>(args.clone());
            }
        }
    }
}

pub(crate) struct LuauEventSystemUserData(pub(crate) Arc<Mutex<LuauEventSystem>>, pub(crate) PluginCallback);

impl LuaUserData for LuauEventSystemUserData {
    fn add_methods<M: mlua::UserDataMethods<Self>>(methods: &mut M) {
        methods.add_meta_method(LuaMetaMethod::Index, |lua, this, key: String| {
            let event_system = Arc::clone(&this.0);
            let event_name = key.clone();

            let tbl = lua.create_table()?;

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

pub(crate) struct LuauEventConnection {
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
