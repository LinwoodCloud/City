// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'info.dart';

class TeamColorMapper extends EnumMapper<TeamColor> {
  TeamColorMapper._();

  static TeamColorMapper? _instance;
  static TeamColorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TeamColorMapper._());
    }
    return _instance!;
  }

  static TeamColor fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TeamColor decode(dynamic value) {
    switch (value) {
      case 'pink':
        return TeamColor.pink;
      case 'red':
        return TeamColor.red;
      case 'orange':
        return TeamColor.orange;
      case 'yellow':
        return TeamColor.yellow;
      case 'green':
        return TeamColor.green;
      case 'blue':
        return TeamColor.blue;
      case 'indigo':
        return TeamColor.indigo;
      case 'purple':
        return TeamColor.purple;
      case 'brown':
        return TeamColor.brown;
      case 'white':
        return TeamColor.white;
      case 'black':
        return TeamColor.black;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TeamColor self) {
    switch (self) {
      case TeamColor.pink:
        return 'pink';
      case TeamColor.red:
        return 'red';
      case TeamColor.orange:
        return 'orange';
      case TeamColor.yellow:
        return 'yellow';
      case TeamColor.green:
        return 'green';
      case TeamColor.blue:
        return 'blue';
      case TeamColor.indigo:
        return 'indigo';
      case TeamColor.purple:
        return 'purple';
      case TeamColor.brown:
        return 'brown';
      case TeamColor.white:
        return 'white';
      case TeamColor.black:
        return 'black';
    }
  }
}

extension TeamColorMapperExtension on TeamColor {
  String toValue() {
    TeamColorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TeamColor>(this) as String;
  }
}

class GameInfoMapper extends ClassMapperBase<GameInfo> {
  GameInfoMapper._();

  static GameInfoMapper? _instance;
  static GameInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameInfoMapper._());
      GameTeamMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameInfo';

  static Map<String, GameTeam> _$teams(GameInfo v) => v.teams;
  static const Field<GameInfo, Map<String, GameTeam>> _f$teams =
      Field('teams', _$teams, opt: true, def: const {});
  static List<String> _$packs(GameInfo v) => v.packs;
  static const Field<GameInfo, List<String>> _f$packs =
      Field('packs', _$packs, opt: true, def: const []);
  static String? _$script(GameInfo v) => v.script;
  static const Field<GameInfo, String> _f$script =
      Field('script', _$script, opt: true);

  @override
  final MappableFields<GameInfo> fields = const {
    #teams: _f$teams,
    #packs: _f$packs,
    #script: _f$script,
  };

  static GameInfo _instantiate(DecodingData data) {
    return GameInfo(
        teams: data.dec(_f$teams),
        packs: data.dec(_f$packs),
        script: data.dec(_f$script));
  }

  @override
  final Function instantiate = _instantiate;

  static GameInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameInfo>(map);
  }

  static GameInfo fromJson(String json) {
    return ensureInitialized().decodeJson<GameInfo>(json);
  }
}

mixin GameInfoMappable {
  String toJson() {
    return GameInfoMapper.ensureInitialized()
        .encodeJson<GameInfo>(this as GameInfo);
  }

  Map<String, dynamic> toMap() {
    return GameInfoMapper.ensureInitialized()
        .encodeMap<GameInfo>(this as GameInfo);
  }

  GameInfoCopyWith<GameInfo, GameInfo, GameInfo> get copyWith =>
      _GameInfoCopyWithImpl(this as GameInfo, $identity, $identity);
  @override
  String toString() {
    return GameInfoMapper.ensureInitialized().stringifyValue(this as GameInfo);
  }

  @override
  bool operator ==(Object other) {
    return GameInfoMapper.ensureInitialized()
        .equalsValue(this as GameInfo, other);
  }

  @override
  int get hashCode {
    return GameInfoMapper.ensureInitialized().hashValue(this as GameInfo);
  }
}

extension GameInfoValueCopy<$R, $Out> on ObjectCopyWith<$R, GameInfo, $Out> {
  GameInfoCopyWith<$R, GameInfo, $Out> get $asGameInfo =>
      $base.as((v, t, t2) => _GameInfoCopyWithImpl(v, t, t2));
}

abstract class GameInfoCopyWith<$R, $In extends GameInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, GameTeam, GameTeamCopyWith<$R, GameTeam, GameTeam>>
      get teams;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get packs;
  $R call({Map<String, GameTeam>? teams, List<String>? packs, String? script});
  GameInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameInfo, $Out>
    implements GameInfoCopyWith<$R, GameInfo, $Out> {
  _GameInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameInfo> $mapper =
      GameInfoMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, GameTeam, GameTeamCopyWith<$R, GameTeam, GameTeam>>
      get teams => MapCopyWith(
          $value.teams, (v, t) => v.copyWith.$chain(t), (v) => call(teams: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get packs =>
      ListCopyWith($value.packs, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(packs: v));
  @override
  $R call(
          {Map<String, GameTeam>? teams,
          List<String>? packs,
          Object? script = $none}) =>
      $apply(FieldCopyWithData({
        if (teams != null) #teams: teams,
        if (packs != null) #packs: packs,
        if (script != $none) #script: script
      }));
  @override
  GameInfo $make(CopyWithData data) => GameInfo(
      teams: data.get(#teams, or: $value.teams),
      packs: data.get(#packs, or: $value.packs),
      script: data.get(#script, or: $value.script));

  @override
  GameInfoCopyWith<$R2, GameInfo, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameInfoCopyWithImpl($value, $cast, t);
}

class GameTeamMapper extends ClassMapperBase<GameTeam> {
  GameTeamMapper._();

  static GameTeamMapper? _instance;
  static GameTeamMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GameTeamMapper._());
      TeamColorMapper.ensureInitialized();
      GlobalVectorDefinitionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GameTeam';

  static String _$description(GameTeam v) => v.description;
  static const Field<GameTeam, String> _f$description =
      Field('description', _$description, opt: true, def: '');
  static TeamColor? _$color(GameTeam v) => v.color;
  static const Field<GameTeam, TeamColor> _f$color =
      Field('color', _$color, opt: true);
  static Set<GlobalVectorDefinition> _$claimedCells(GameTeam v) =>
      v.claimedCells;
  static const Field<GameTeam, Set<GlobalVectorDefinition>> _f$claimedCells =
      Field('claimedCells', _$claimedCells, opt: true, def: const {});

  @override
  final MappableFields<GameTeam> fields = const {
    #description: _f$description,
    #color: _f$color,
    #claimedCells: _f$claimedCells,
  };

  static GameTeam _instantiate(DecodingData data) {
    return GameTeam(
        description: data.dec(_f$description),
        color: data.dec(_f$color),
        claimedCells: data.dec(_f$claimedCells));
  }

  @override
  final Function instantiate = _instantiate;

  static GameTeam fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GameTeam>(map);
  }

  static GameTeam fromJson(String json) {
    return ensureInitialized().decodeJson<GameTeam>(json);
  }
}

mixin GameTeamMappable {
  String toJson() {
    return GameTeamMapper.ensureInitialized()
        .encodeJson<GameTeam>(this as GameTeam);
  }

  Map<String, dynamic> toMap() {
    return GameTeamMapper.ensureInitialized()
        .encodeMap<GameTeam>(this as GameTeam);
  }

  GameTeamCopyWith<GameTeam, GameTeam, GameTeam> get copyWith =>
      _GameTeamCopyWithImpl(this as GameTeam, $identity, $identity);
  @override
  String toString() {
    return GameTeamMapper.ensureInitialized().stringifyValue(this as GameTeam);
  }

  @override
  bool operator ==(Object other) {
    return GameTeamMapper.ensureInitialized()
        .equalsValue(this as GameTeam, other);
  }

  @override
  int get hashCode {
    return GameTeamMapper.ensureInitialized().hashValue(this as GameTeam);
  }
}

extension GameTeamValueCopy<$R, $Out> on ObjectCopyWith<$R, GameTeam, $Out> {
  GameTeamCopyWith<$R, GameTeam, $Out> get $asGameTeam =>
      $base.as((v, t, t2) => _GameTeamCopyWithImpl(v, t, t2));
}

abstract class GameTeamCopyWith<$R, $In extends GameTeam, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? description,
      TeamColor? color,
      Set<GlobalVectorDefinition>? claimedCells});
  GameTeamCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GameTeamCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GameTeam, $Out>
    implements GameTeamCopyWith<$R, GameTeam, $Out> {
  _GameTeamCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GameTeam> $mapper =
      GameTeamMapper.ensureInitialized();
  @override
  $R call(
          {String? description,
          Object? color = $none,
          Set<GlobalVectorDefinition>? claimedCells}) =>
      $apply(FieldCopyWithData({
        if (description != null) #description: description,
        if (color != $none) #color: color,
        if (claimedCells != null) #claimedCells: claimedCells
      }));
  @override
  GameTeam $make(CopyWithData data) => GameTeam(
      description: data.get(#description, or: $value.description),
      color: data.get(#color, or: $value.color),
      claimedCells: data.get(#claimedCells, or: $value.claimedCells));

  @override
  GameTeamCopyWith<$R2, GameTeam, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GameTeamCopyWithImpl($value, $cast, t);
}
