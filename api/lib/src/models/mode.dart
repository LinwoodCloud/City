import 'package:dart_mappable/dart_mappable.dart';

import 'info.dart';
import 'table.dart';

part 'mode.mapper.dart';

@MappableClass()
final class GameMode with GameModeMappable {
  final String? script;

  final Map<String, GameTable> tables;
  final String tableName;
  final Map<String, GameTeam> teams;

  GameMode({
    required this.script,
    this.tables = const {},
    this.tableName = '',
    this.teams = const {},
  });
}
