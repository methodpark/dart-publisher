import 'package:args/command_runner.dart';

import 'apple/app_store_connect_command.dart';
import 'google/google_play_command.dart';

class PublisherCommand extends CommandRunner<dynamic> {
  PublisherCommand()
      : super(
            'publisher', 'Tool for release automation of cross-platform apps') {
    addCommand(GooglePlay());
    addCommand(AppStoreConnect());
  }

  @override
  String? get usageFooter =>
      'For more information have a look at the manual here: https://pub.dev/packages/publisher';
}
