import 'package:args/command_runner.dart';

abstract class GeneralCommand extends Command<dynamic> {
  String? getArgResult(String argumentName) {
    return argResults?[argumentName].toString().trim();
  }
}
