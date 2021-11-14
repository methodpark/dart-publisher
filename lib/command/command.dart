import 'package:args/command_runner.dart';

export 'appstoreconnect_command.dart';
export 'googleplay_command.dart';

abstract class GeneralCommand<T> extends Command<dynamic> {
  /// check environment variables for command
  bool envCheck();

  /// initialize model from args data
  T init();

  /// execute sub command
  Future<void> exec(T arg);

  String? getArgResult(String argumentName) {
    return argResults?[argumentName].toString().trim();
  }
}
