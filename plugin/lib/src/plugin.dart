import 'dart:async';

import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:networker/networker.dart';
import 'package:setonix_api/event.dart';
import 'package:setonix_plugin/setonix_plugin.dart';

typedef PluginProcessCallback = void Function(String, WorldEvent, [bool force]);
typedef PluginSendEventCallback = void Function(
    String, NetworkerPacket<PlayableWorldEvent>);

final class PluginSystem {
  final Map<
      String,
      (
        SetonixPlugin,
        StreamSubscription<ProcessMessage>,
        StreamSubscription<NetworkerPacket<PlayableWorldEvent>>
      )> _plugins = {};
  final PluginProcessCallback _onProcess;
  final PluginSendEventCallback _onSendEvent;

  PluginSystem(
      {required PluginProcessCallback onProcess,
      required PluginSendEventCallback onSendEvent})
      : _onProcess = onProcess,
        _onSendEvent = onSendEvent;

  void registerPlugin(String name, SetonixPlugin plugin) {
    final processSub = plugin.onProcess
        .listen((message) => _onProcess(name, message.event, message.force));
    final sendSub =
        plugin.onSendEvent.listen((event) => _onSendEvent(name, event));
    _plugins[name] = (plugin, processSub, sendSub);
  }

  SetonixPlugin registerLuauPlugin(String name, String code,
      {void Function(String)? onPrint}) {
    final plugin =
        RustSetonixPlugin.build((c) => LuauPlugin(code: code, callback: c));
    registerPlugin(name, plugin);
    return plugin;
  }

  void unregisterPlugin(String name) {
    final data = _plugins.remove(name);
    data?.$1.dispose();
    data?.$2.cancel();
    data?.$3.cancel();
  }

  void dispose() {
    List<String>.from(_plugins.keys).forEach(unregisterPlugin);
  }
}

final class ProcessMessage {
  final WorldEvent event;
  final bool force;

  ProcessMessage(this.event, this.force);
}

base class SetonixPlugin {
  final EventSystem eventSystem = EventSystem();
  final StreamController<ProcessMessage> _onProcessController =
      StreamController.broadcast();
  final StreamController<NetworkerPacket<PlayableWorldEvent>>
      _onSendEventController = StreamController.broadcast();

  Stream<ProcessMessage> get onProcess => _onProcessController.stream;
  Stream<NetworkerPacket<PlayableWorldEvent>> get onSendEvent =>
      _onSendEventController.stream;

  void process(WorldEvent event, {bool force = false}) =>
      _onProcessController.add(ProcessMessage(event, force));

  void sendEvent(PlayableWorldEvent event, [Channel target = kAnyChannel]) =>
      _onSendEventController.add(NetworkerPacket(event, target));

  void dispose() {
    eventSystem.dispose();
    _onProcessController.close();
    _onSendEventController.close();
  }
}

final class RustSetonixPlugin extends SetonixPlugin {
  final RustPlugin plugin;

  RustSetonixPlugin._(this.plugin);

  factory RustSetonixPlugin.build(
    RustPlugin Function(PluginCallback) builder, {
    void Function(String)? onPrint,
  }) {
    final callback = PluginCallback.default_();
    final plugin = builder(callback);
    final instance = RustSetonixPlugin._(plugin);
    if (onPrint != null) {
      callback.changeOnPrint(onPrint: onPrint);
    }
    callback.changeProcessEvent(processEvent: (eventSerizalized, force) {
      final event = WorldEventMapper.fromJson(eventSerizalized);
      instance.process(event, force: force ?? false);
    });
    callback.changeSendEvent(sendEvent: (eventSerizalized, target) {
      final event = PlayableWorldEventMapper.fromJson(eventSerizalized);
      instance.sendEvent(event, target ?? kAnyChannel);
    });
    return instance;
  }

  @override
  void dispose() {
    super.dispose();
    if (plugin is RustOpaqueInterface) {
      (plugin as RustOpaqueInterface).dispose();
    }
  }
}
