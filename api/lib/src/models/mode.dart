import 'package:dart_mappable/dart_mappable.dart';

import 'info.dart';
import 'table.dart';

part 'mode.mapper.dart';

@MappableClass()
final class GameMode with GameModeMappable {
  final String? script;

  final Map<String, GameTable> table;
  final String tableName;
  final List<GameTeam> teams;

  GameMode({
    required this.script,
    this.table = const {
      '': GameTable(),
    },
    this.tableName = '',
    this.teams = const [],
  });
}
