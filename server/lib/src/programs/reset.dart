import 'package:consoler/consoler.dart';
import 'package:setonix_api/setonix_api.dart';
import 'package:setonix_server/src/server.dart';

class ResetProgram extends ConsoleProgram {
  final SetonixServer server;

  ResetProgram(this.server);

  @override
  String getDescription() =>
      "Reset the world. Specify a game mode to allow playing games.";

  @override
  String getUsage() => 'reset [<Mode>]';

  @override
  Future<void> run(String label, List<String> args) async {
    if (args.length > 1) {
      server.log("Wrong usage, use ${getUsage()}", level: LogLevel.error);
    }
    final mode = args.isEmpty ? null : ItemLocation.fromString(args[0]);
    server.log("Resetting world...", level: LogLevel.info);
    await server.resetWorld(mode);
    server.log("World reset successful", level: LogLevel.info);
  }
}
