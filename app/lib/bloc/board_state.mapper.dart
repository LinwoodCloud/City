// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'board_state.dart';

class BoardStateMapper extends ClassMapperBase<BoardState> {
  BoardStateMapper._();

  static BoardStateMapper? _instance;
  static BoardStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BoardStateMapper._());
      GameTableMapper.ensureInitialized();
      VectorDefinitionMapper.ensureInitialized();
      ItemLocationMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'BoardState';

  static QuokkaFileSystem _$fileSystem(BoardState v) => v.fileSystem;
  static const Field<BoardState, QuokkaFileSystem> _f$fileSystem =
      Field('fileSystem', _$fileSystem);
  static String? _$name(BoardState v) => v.name;
  static const Field<BoardState, String> _f$name =
      Field('name', _$name, opt: true);
  static ColorScheme? _$colorScheme(BoardState v) => v.colorScheme;
  static const Field<BoardState, ColorScheme> _f$colorScheme =
      Field('colorScheme', _$colorScheme, opt: true);
  static GameTable _$table(BoardState v) => v.table;
  static const Field<BoardState, GameTable> _f$table =
      Field('table', _$table, opt: true, def: const GameTable());
  static VectorDefinition? _$selectedCell(BoardState v) => v.selectedCell;
  static const Field<BoardState, VectorDefinition> _f$selectedCell =
      Field('selectedCell', _$selectedCell, opt: true);
  static ItemLocation? _$selectedDeck(BoardState v) => v.selectedDeck;
  static const Field<BoardState, ItemLocation> _f$selectedDeck =
      Field('selectedDeck', _$selectedDeck, opt: true);
  static bool _$showHand(BoardState v) => v.showHand;
  static const Field<BoardState, bool> _f$showHand =
      Field('showHand', _$showHand, opt: true, def: false);
  static QuokkaData _$data(BoardState v) => v.data;
  static const Field<BoardState, QuokkaData> _f$data = Field('data', _$data);

  @override
  final MappableFields<BoardState> fields = const {
    #fileSystem: _f$fileSystem,
    #name: _f$name,
    #colorScheme: _f$colorScheme,
    #table: _f$table,
    #selectedCell: _f$selectedCell,
    #selectedDeck: _f$selectedDeck,
    #showHand: _f$showHand,
    #data: _f$data,
  };

  static BoardState _instantiate(DecodingData data) {
    return BoardState(
        fileSystem: data.dec(_f$fileSystem),
        name: data.dec(_f$name),
        colorScheme: data.dec(_f$colorScheme),
        table: data.dec(_f$table),
        selectedCell: data.dec(_f$selectedCell),
        selectedDeck: data.dec(_f$selectedDeck),
        showHand: data.dec(_f$showHand),
        data: data.dec(_f$data));
  }

  @override
  final Function instantiate = _instantiate;

  static BoardState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<BoardState>(map);
  }

  static BoardState fromJson(String json) {
    return ensureInitialized().decodeJson<BoardState>(json);
  }
}

mixin BoardStateMappable {
  String toJson() {
    return BoardStateMapper.ensureInitialized()
        .encodeJson<BoardState>(this as BoardState);
  }

  Map<String, dynamic> toMap() {
    return BoardStateMapper.ensureInitialized()
        .encodeMap<BoardState>(this as BoardState);
  }

  BoardStateCopyWith<BoardState, BoardState, BoardState> get copyWith =>
      _BoardStateCopyWithImpl(this as BoardState, $identity, $identity);
  @override
  String toString() {
    return BoardStateMapper.ensureInitialized()
        .stringifyValue(this as BoardState);
  }

  @override
  bool operator ==(Object other) {
    return BoardStateMapper.ensureInitialized()
        .equalsValue(this as BoardState, other);
  }

  @override
  int get hashCode {
    return BoardStateMapper.ensureInitialized().hashValue(this as BoardState);
  }
}

extension BoardStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, BoardState, $Out> {
  BoardStateCopyWith<$R, BoardState, $Out> get $asBoardState =>
      $base.as((v, t, t2) => _BoardStateCopyWithImpl(v, t, t2));
}

abstract class BoardStateCopyWith<$R, $In extends BoardState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  GameTableCopyWith<$R, GameTable, GameTable> get table;
  VectorDefinitionCopyWith<$R, VectorDefinition, VectorDefinition>?
      get selectedCell;
  ItemLocationCopyWith<$R, ItemLocation, ItemLocation>? get selectedDeck;
  $R call(
      {QuokkaFileSystem? fileSystem,
      String? name,
      ColorScheme? colorScheme,
      GameTable? table,
      VectorDefinition? selectedCell,
      ItemLocation? selectedDeck,
      bool? showHand,
      QuokkaData? data});
  BoardStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BoardStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, BoardState, $Out>
    implements BoardStateCopyWith<$R, BoardState, $Out> {
  _BoardStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<BoardState> $mapper =
      BoardStateMapper.ensureInitialized();
  @override
  GameTableCopyWith<$R, GameTable, GameTable> get table =>
      $value.table.copyWith.$chain((v) => call(table: v));
  @override
  VectorDefinitionCopyWith<$R, VectorDefinition, VectorDefinition>?
      get selectedCell =>
          $value.selectedCell?.copyWith.$chain((v) => call(selectedCell: v));
  @override
  ItemLocationCopyWith<$R, ItemLocation, ItemLocation>? get selectedDeck =>
      $value.selectedDeck?.copyWith.$chain((v) => call(selectedDeck: v));
  @override
  $R call(
          {QuokkaFileSystem? fileSystem,
          Object? name = $none,
          Object? colorScheme = $none,
          GameTable? table,
          Object? selectedCell = $none,
          Object? selectedDeck = $none,
          bool? showHand,
          QuokkaData? data}) =>
      $apply(FieldCopyWithData({
        if (fileSystem != null) #fileSystem: fileSystem,
        if (name != $none) #name: name,
        if (colorScheme != $none) #colorScheme: colorScheme,
        if (table != null) #table: table,
        if (selectedCell != $none) #selectedCell: selectedCell,
        if (selectedDeck != $none) #selectedDeck: selectedDeck,
        if (showHand != null) #showHand: showHand,
        if (data != null) #data: data
      }));
  @override
  BoardState $make(CopyWithData data) => BoardState(
      fileSystem: data.get(#fileSystem, or: $value.fileSystem),
      name: data.get(#name, or: $value.name),
      colorScheme: data.get(#colorScheme, or: $value.colorScheme),
      table: data.get(#table, or: $value.table),
      selectedCell: data.get(#selectedCell, or: $value.selectedCell),
      selectedDeck: data.get(#selectedDeck, or: $value.selectedDeck),
      showHand: data.get(#showHand, or: $value.showHand),
      data: data.get(#data, or: $value.data));

  @override
  BoardStateCopyWith<$R2, BoardState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _BoardStateCopyWithImpl($value, $cast, t);
}
