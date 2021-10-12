import 'package:args/command_runner.dart';

import 'upload_bundle_command.dart';

class GooglePlay extends Command<dynamic> {
  @override
  final name = 'googleplay';
  @override
  final description = 'Google Play related commands';

  GooglePlay() {
    addSubcommand(UploadBundle());
  }
}
