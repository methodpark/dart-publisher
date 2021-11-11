import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:publisher/src/app_store_connect/app_store_connect_command.dart';

import 'google/google_play_command.dart';

Future<void> run(List<String> args) async {
  var runner = CommandRunner<dynamic>(
      'publisher', 'Tool for release automation of cross-platform apps')
    ..addCommand(GooglePlay())
    ..addCommand(AppStoreConnect());

  try {
    await runner.run(args);
  } catch (exception) {
    if (exception is! UsageException) {
      print(
          'An error occured. Please have a look at the help section of your command or the documentation of this tool');
      print(runner.argParser.usage);
    }
    print(exception);
    exit(64);
  }
}
