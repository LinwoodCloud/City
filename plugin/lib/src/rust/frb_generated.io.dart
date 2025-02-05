// This file is automatically generated, so please do not edit it.
// @generated by `flutter_rust_bridge`@ 2.7.1.

// ignore_for_file: unused_import, unused_element, unnecessary_import, duplicate_ignore, invalid_use_of_internal_member, annotate_overrides, non_constant_identifier_names, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, unused_field

import 'api/luau.dart';
import 'api/plugin.dart';
import 'api/simple.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi' as ffi;
import 'frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated_io.dart';

abstract class RustLibApiImplPlatform extends BaseApiImpl<RustLibWire> {
  RustLibApiImplPlatform({
    required super.handler,
    required super.wire,
    required super.generalizedFrbRustBinding,
    required super.portManager,
  });

  CrossPlatformFinalizerArg get rust_arc_decrement_strong_count_LuauPluginPtr =>
      wire._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPluginPtr;

  CrossPlatformFinalizerArg
      get rust_arc_decrement_strong_count_PluginCallbackPtr => wire
          ._rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallbackPtr;

  @protected
  AnyhowException dco_decode_AnyhowException(dynamic raw);

  @protected
  LuauPlugin
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          dynamic raw);

  @protected
  PluginCallback
      dco_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          dynamic raw);

  @protected
  PluginCallback
      dco_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          dynamic raw);

  @protected
  LuauPlugin
      dco_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          dynamic raw);

  @protected
  FutureOr<void> Function(String)
      dco_decode_DartFn_Inputs_String_Output_unit_AnyhowException(dynamic raw);

  @protected
  FutureOr<void> Function(String, bool?)
      dco_decode_DartFn_Inputs_String_opt_box_autoadd_bool_Output_unit_AnyhowException(
          dynamic raw);

  @protected
  FutureOr<void> Function(String, int?)
      dco_decode_DartFn_Inputs_String_opt_box_autoadd_i_16_Output_unit_AnyhowException(
          dynamic raw);

  @protected
  FutureOr<String> Function(StateFieldAccess)
      dco_decode_DartFn_Inputs_state_field_access_Output_String_AnyhowException(
          dynamic raw);

  @protected
  Object dco_decode_DartOpaque(dynamic raw);

  @protected
  LuauPlugin
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          dynamic raw);

  @protected
  PluginCallback
      dco_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          dynamic raw);

  @protected
  Set<int> dco_decode_Set_i_16(dynamic raw);

  @protected
  String dco_decode_String(dynamic raw);

  @protected
  RustPlugin dco_decode_TraitDef_RustPlugin(dynamic raw);

  @protected
  bool dco_decode_bool(dynamic raw);

  @protected
  bool dco_decode_box_autoadd_bool(dynamic raw);

  @protected
  int dco_decode_box_autoadd_i_16(dynamic raw);

  @protected
  EventResult dco_decode_event_result(dynamic raw);

  @protected
  int dco_decode_i_16(dynamic raw);

  @protected
  int dco_decode_i_32(dynamic raw);

  @protected
  PlatformInt64 dco_decode_isize(dynamic raw);

  @protected
  Int16List dco_decode_list_prim_i_16_strict(dynamic raw);

  @protected
  Uint8List dco_decode_list_prim_u_8_strict(dynamic raw);

  @protected
  Set<int>? dco_decode_opt_Set_i_16(dynamic raw);

  @protected
  String? dco_decode_opt_String(dynamic raw);

  @protected
  bool? dco_decode_opt_box_autoadd_bool(dynamic raw);

  @protected
  int? dco_decode_opt_box_autoadd_i_16(dynamic raw);

  @protected
  StateFieldAccess dco_decode_state_field_access(dynamic raw);

  @protected
  int dco_decode_u_8(dynamic raw);

  @protected
  void dco_decode_unit(dynamic raw);

  @protected
  BigInt dco_decode_usize(dynamic raw);

  @protected
  AnyhowException sse_decode_AnyhowException(SseDeserializer deserializer);

  @protected
  LuauPlugin
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          SseDeserializer deserializer);

  @protected
  PluginCallback
      sse_decode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          SseDeserializer deserializer);

  @protected
  PluginCallback
      sse_decode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          SseDeserializer deserializer);

  @protected
  LuauPlugin
      sse_decode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          SseDeserializer deserializer);

  @protected
  Object sse_decode_DartOpaque(SseDeserializer deserializer);

  @protected
  LuauPlugin
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          SseDeserializer deserializer);

  @protected
  PluginCallback
      sse_decode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          SseDeserializer deserializer);

  @protected
  Set<int> sse_decode_Set_i_16(SseDeserializer deserializer);

  @protected
  String sse_decode_String(SseDeserializer deserializer);

  @protected
  bool sse_decode_bool(SseDeserializer deserializer);

  @protected
  bool sse_decode_box_autoadd_bool(SseDeserializer deserializer);

  @protected
  int sse_decode_box_autoadd_i_16(SseDeserializer deserializer);

  @protected
  EventResult sse_decode_event_result(SseDeserializer deserializer);

  @protected
  int sse_decode_i_16(SseDeserializer deserializer);

  @protected
  int sse_decode_i_32(SseDeserializer deserializer);

  @protected
  PlatformInt64 sse_decode_isize(SseDeserializer deserializer);

  @protected
  Int16List sse_decode_list_prim_i_16_strict(SseDeserializer deserializer);

  @protected
  Uint8List sse_decode_list_prim_u_8_strict(SseDeserializer deserializer);

  @protected
  Set<int>? sse_decode_opt_Set_i_16(SseDeserializer deserializer);

  @protected
  String? sse_decode_opt_String(SseDeserializer deserializer);

  @protected
  bool? sse_decode_opt_box_autoadd_bool(SseDeserializer deserializer);

  @protected
  int? sse_decode_opt_box_autoadd_i_16(SseDeserializer deserializer);

  @protected
  StateFieldAccess sse_decode_state_field_access(SseDeserializer deserializer);

  @protected
  int sse_decode_u_8(SseDeserializer deserializer);

  @protected
  void sse_decode_unit(SseDeserializer deserializer);

  @protected
  BigInt sse_decode_usize(SseDeserializer deserializer);

  @protected
  void sse_encode_AnyhowException(
      AnyhowException self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          LuauPlugin self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Owned_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          PluginCallback self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_RefMut_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          PluginCallback self, SseSerializer serializer);

  @protected
  void
      sse_encode_Auto_Ref_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          LuauPlugin self, SseSerializer serializer);

  @protected
  void sse_encode_DartFn_Inputs_String_Output_unit_AnyhowException(
      FutureOr<void> Function(String) self, SseSerializer serializer);

  @protected
  void
      sse_encode_DartFn_Inputs_String_opt_box_autoadd_bool_Output_unit_AnyhowException(
          FutureOr<void> Function(String, bool?) self,
          SseSerializer serializer);

  @protected
  void
      sse_encode_DartFn_Inputs_String_opt_box_autoadd_i_16_Output_unit_AnyhowException(
          FutureOr<void> Function(String, int?) self, SseSerializer serializer);

  @protected
  void
      sse_encode_DartFn_Inputs_state_field_access_Output_String_AnyhowException(
          FutureOr<String> Function(StateFieldAccess) self,
          SseSerializer serializer);

  @protected
  void sse_encode_DartOpaque(Object self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
          LuauPlugin self, SseSerializer serializer);

  @protected
  void
      sse_encode_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
          PluginCallback self, SseSerializer serializer);

  @protected
  void sse_encode_Set_i_16(Set<int> self, SseSerializer serializer);

  @protected
  void sse_encode_String(String self, SseSerializer serializer);

  @protected
  void sse_encode_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_bool(bool self, SseSerializer serializer);

  @protected
  void sse_encode_box_autoadd_i_16(int self, SseSerializer serializer);

  @protected
  void sse_encode_event_result(EventResult self, SseSerializer serializer);

  @protected
  void sse_encode_i_16(int self, SseSerializer serializer);

  @protected
  void sse_encode_i_32(int self, SseSerializer serializer);

  @protected
  void sse_encode_isize(PlatformInt64 self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_i_16_strict(
      Int16List self, SseSerializer serializer);

  @protected
  void sse_encode_list_prim_u_8_strict(
      Uint8List self, SseSerializer serializer);

  @protected
  void sse_encode_opt_Set_i_16(Set<int>? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_String(String? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_bool(bool? self, SseSerializer serializer);

  @protected
  void sse_encode_opt_box_autoadd_i_16(int? self, SseSerializer serializer);

  @protected
  void sse_encode_state_field_access(
      StateFieldAccess self, SseSerializer serializer);

  @protected
  void sse_encode_u_8(int self, SseSerializer serializer);

  @protected
  void sse_encode_unit(void self, SseSerializer serializer);

  @protected
  void sse_encode_usize(BigInt self, SseSerializer serializer);
}

// Section: wire_class

class RustLibWire implements BaseWire {
  factory RustLibWire.fromExternalLibrary(ExternalLibrary lib) =>
      RustLibWire(lib.ffiDynamicLibrary);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustLibWire(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPluginPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_setonix_plugin_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPluginPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPluginPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_setonix_plugin_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPlugin =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerLuauPluginPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
      ptr,
    );
  }

  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallbackPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_setonix_plugin_rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback');
  late final _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback =
      _rust_arc_increment_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallbackPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();

  void
      rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
    ffi.Pointer<ffi.Void> ptr,
  ) {
    return _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback(
      ptr,
    );
  }

  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallbackPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Void>)>>(
          'frbgen_setonix_plugin_rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback');
  late final _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallback =
      _rust_arc_decrement_strong_count_RustOpaque_flutter_rust_bridgefor_generatedRustAutoOpaqueInnerPluginCallbackPtr
          .asFunction<void Function(ffi.Pointer<ffi.Void>)>();
}
