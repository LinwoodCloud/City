
use std::{collections::HashSet, sync::Arc};

use flutter_rust_bridge::{frb, DartFnFuture};
use serde::{Deserialize, Serialize};
use serde_json::{Map, Value};


pub type DartCallback<T> = Arc<dyn Fn(T) -> DartFnFuture<()> + Send + Sync>;
// see https://github.com/rust-lang/lang-team/blob/master/src/design_notes/variadic_generics.md
// for more information on variadic generics
pub type DartCallback2<T, U> = Arc<dyn Fn(T, U) -> DartFnFuture<()> + Send + Sync>;

#[derive(strum::Display, strum::EnumIter, Clone, Copy)]
pub enum StateFieldAccess {
    Table,
    TableName,
    Info,
    Players,
    TeamMembers,
}

#[derive(Clone)]
pub struct PluginCallback {
    pub(crate) on_print: DartCallback<String>,
    pub(crate) process_event: DartCallback2<String, Option<bool>>,
    pub(crate) send_event: DartCallback2<String, Option<Channel>>,
    pub(crate) state_field_access: Arc<dyn Fn(StateFieldAccess) -> DartFnFuture<String> + Send + Sync>,
}

impl Default for PluginCallback {
    #[frb(sync)]
    fn default() -> Self {
        Self {
            on_print: Arc::new(|s| {
                Box::pin(async move {
                    println!("{}", s);
                })
            }),
            process_event: Arc::new(|_, _| Box::pin(async {})),
            send_event: Arc::new(|_, _| Box::pin(async {})),
            state_field_access: Arc::new(|_| Box::pin(async { "".to_string() })),
        }
    }
}
impl PluginCallback {
    #[frb(sync)]
    pub fn change_on_print(&mut self, on_print: impl Fn(String) -> DartFnFuture<()> + 'static + Send + Sync) {
        self.on_print = Arc::new(Box::new(on_print)); // or sth like that
    }
    
    #[frb(sync)]
    pub fn change_process_event(&mut self, process_event: impl Fn(String, Option<bool>) -> DartFnFuture<()> + 'static + Send + Sync) {
        self.process_event = Arc::new(Box::new(process_event)); // or sth like that
    }

    #[frb(sync)]
    pub fn change_send_event(&mut self, send_event: impl Fn(String, Option<Channel>) -> DartFnFuture<()> + 'static + Send + Sync) {
        self.send_event = Arc::new(Box::new(send_event)); // or sth like that
    }

    #[frb(sync)]
    pub fn change_state_field_access(&mut self, state_field_access: impl Fn(StateFieldAccess) -> DartFnFuture<String> + 'static + Send + Sync) {
        self.state_field_access = Arc::new(Box::new(state_field_access)); // or sth like that
    }
}

pub type Channel = i16;
pub type JsonObject = Map<String, Value>;

pub trait RustPlugin {
    fn run_event(&self, event_type: String, event: String, server_event: String, source: Channel, target: Channel) -> EventResult;
    fn run(&self) -> anyhow::Result<()>;
}

#[derive(Serialize, Deserialize)]
#[frb(opaque)]
pub(crate) struct EventDetails {
    pub(crate) source: Channel,
    pub(crate) server_event: JsonObject,
    pub(crate) target: Channel,
    pub(crate) cancelled: bool,
    pub(crate) needs_update: Option<HashSet<Channel>>, // Option to handle nullable Set<Channel>?
}

impl EventDetails {
    // Constructor equivalent
    pub(crate) fn new(
        server_event: JsonObject,
        target: Channel,
        source: Channel,
        needs_update: Option<HashSet<Channel>>,
    ) -> Self {
        Self {
            server_event,
            target,
            source,
            cancelled: false,
            needs_update,
        }
    }
}

#[derive(Serialize, Deserialize)]
pub struct EventResult {
    pub target: Channel,
    pub server_event: Option<String>,
    pub needs_update: Option<HashSet<Channel>>,
}

impl From<EventDetails> for EventResult {
    #[frb(ignore)]
    fn from(details: EventDetails) -> Self {
        Self {
            target: details.target,
            server_event: details.cancelled.then(|| serde_json::to_string(&details.server_event).unwrap()),
            needs_update: details.needs_update,
        }
    }
}
