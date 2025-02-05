// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'plugin.dart';

// These functions are ignored because they are not marked as `pub`: `construct_globals`, `construct_on_print`

// Rust type: RustOpaqueMoi<flutter_rust_bridge::for_generated::RustAutoOpaqueInner<LuauPlugin>>
abstract class LuauPlugin implements RustOpaqueInterface, RustPlugin {
  factory LuauPlugin(
          {required String code, required PluginCallback callback}) =>
      RustLib.instance.api
          .crateApiLuauLuauPluginNew(code: code, callback: callback);

  Future<void> run();

  Future<EventResult> runEvent(
      {required String eventType,
      required String event,
      required String serverEvent,
      required int source,
      required int target});
}
