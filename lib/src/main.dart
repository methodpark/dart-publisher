import 'dart:io';

import 'package:args/command_runner.dart';

import 'publisher_command.dart';

Future<void> run(List<String> args) async {
  var runner = PublisherCommand();

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
