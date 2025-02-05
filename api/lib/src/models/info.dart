import 'package:dart_mappable/dart_mappable.dart';

import 'table.dart';

part 'info.mapper.dart';

@MappableClass()
class GameInfo with GameInfoMappable {
  final Map<String, GameTeam> teams;
  final List<String> packs;
  final String? script;

  const GameInfo({
    this.teams = const {},
    this.packs = const [],
    this.script,
  });
}

@MappableEnum()
enum TeamColor {
  pink,
  red,
  orange,
  yellow,
  green,
  blue,
  indigo,
  purple,
  brown,
  white,
  black;
}

@MappableClass()
class GameTeam with GameTeamMappable {
  final String description;
  final TeamColor? color;
  final Set<GlobalVectorDefinition> claimedCells;

  GameTeam({
    this.description = '',
    this.color,
    this.claimedCells = const {},
  });
}
