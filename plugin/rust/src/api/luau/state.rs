use futures::executor::block_on;
use mlua::prelude::*;
use serde_json::Value;
use strum::IntoEnumIterator;

use crate::api::plugin::{PluginCallback, StateFieldAccess};

pub(crate) struct LuauStateUserData(pub(crate) PluginCallback);

impl LuaUserData for LuauStateUserData {
    fn add_fields<F: LuaUserDataFields<Self>>(fields: &mut F) {
        for field in StateFieldAccess::iter() {
            let name = field.to_string();
            fields.add_field_method_get(name, move |lua, this| {
                let callback = this.0.state_field_access.clone();
                let result = block_on(callback(field.clone()));
                let result = serde_json::from_str::<Value>(&result).unwrap();
                let serialized = lua.to_value(&result).unwrap();
                Ok(serialized)
            });
        }
    }
}
