// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'mode.dart';

class GameModeMapper extends ClassMapperBase<GameMode> {
  GameModeMapper._();

  static GameModeMapper? _instance;
  static GameModeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameModeMapper._());
      GameTableMapper.ensureInitialized();
      GameTeamMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameMode';

  static String? _$script(GameMode v) => v.script;
  static const Field<GameMode, String> _f$script = Field('script', _$script);
  static Map<String, GameTable> _$table(GameMode v) => v.table;
  static const Field<GameMode, Map<String, GameTable>> _f$table =
      Field('table', _$table, opt: true, def: const {'': GameTable()});
  static String _$tableName(GameMode v) => v.tableName;
  static const Field<GameMode, String> _f$tableName =
      Field('tableName', _$tableName, opt: true, def: '');
  static List<GameTeam> _$teams(GameMode v) => v.teams;
  static const Field<GameMode, List<GameTeam>> _f$teams =
      Field('teams', _$teams, opt: true, def: const []);

  @override
  final MappableFields<GameMode> fields = const {
    #script: _f$script,
    #table: _f$table,
    #tableName: _f$tableName,
    #teams: _f$teams,
  };

  static GameMode _instantiate(DecodingData data) {
    return GameMode(
        script: data.dec(_f$script),
        table: data.dec(_f$table),
        tableName: data.dec(_f$tableName),
        teams: data.dec(_f$teams));
  }

  @override
  final Function instantiate = _instantiate;

  static GameMode fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameMode>(map);
  }

  static GameMode fromJson(String json) {
    return ensureInitialized().decodeJson<GameMode>(json);
  }
}

mixin GameModeMappable {
  String toJson() {
    return GameModeMapper.ensureInitialized()
        .encodeJson<GameMode>(this as GameMode);
  }

  Map<String, dynamic> toMap() {
    return GameModeMapper.ensureInitialized()
        .encodeMap<GameMode>(this as GameMode);
  }

  GameModeCopyWith<GameMode, GameMode, GameMode> get copyWith =>
      _GameModeCopyWithImpl(this as GameMode, $identity, $identity);
  @override
  String toString() {
    return GameModeMapper.ensureInitialized().stringifyValue(this as GameMode);
  }

  @override
  bool operator ==(Object other) {
    return GameModeMapper.ensureInitialized()
        .equalsValue(this as GameMode, other);
  }

  @override
  int get hashCode {
    return GameModeMapper.ensureInitialized().hashValue(this as GameMode);
  }
}

extension GameModeValueCopy<$R, $Out> on ObjectCopyWith<$R, GameMode, $Out> {
  GameModeCopyWith<$R, GameMode, $Out> get $asGameMode =>
      $base.as((v, t, t2) => _GameModeCopyWithImpl(v, t, t2));
}

abstract class GameModeCopyWith<$R, $In extends GameMode, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, GameTable,
      GameTableCopyWith<$R, GameTable, GameTable>> get table;
  ListCopyWith<$R, GameTeam, GameTeamCopyWith<$R, GameTeam, GameTeam>>
      get teams;
  $R call(
      {String? script,
      Map<String, GameTable>? table,
      String? tableName,
      List<GameTeam>? teams});
  GameModeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameModeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameMode, $Out>
    implements GameModeCopyWith<$R, GameMode, $Out> {
  _GameModeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameMode> $mapper =
      GameModeMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, GameTable,
          GameTableCopyWith<$R, GameTable, GameTable>>
      get table => MapCopyWith(
          $value.table, (v, t) => v.copyWith.$chain(t), (v) => call(table: v));
  @override
  ListCopyWith<$R, GameTeam, GameTeamCopyWith<$R, GameTeam, GameTeam>>
      get teams => ListCopyWith(
          $value.teams, (v, t) => v.copyWith.$chain(t), (v) => call(teams: v));
  @override
  $R call(
          {Object? script = $none,
          Map<String, GameTable>? table,
          String? tableName,
          List<GameTeam>? teams}) =>
      $apply(FieldCopyWithData({
        if (script != $none) #script: script,
        if (table != null) #table: table,
        if (tableName != null) #tableName: tableName,
        if (teams != null) #teams: teams
      }));
  @override
  GameMode $make(CopyWithData data) => GameMode(
      script: data.get(#script, or: $value.script),
      table: data.get(#table, or: $value.table),
      tableName: data.get(#tableName, or: $value.tableName),
      teams: data.get(#teams, or: $value.teams));

  @override
  GameModeCopyWith<$R2, GameMode, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameModeCopyWithImpl($value, $cast, t);
}
