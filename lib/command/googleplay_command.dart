import 'package:args/command_runner.dart';
import 'package:publisher/features/google_play/google_play.dart';

class GooglePlayCommand extends Command<dynamic> {
  GooglePlayCommand() {
    addSubcommand(UploadBundleSub());
    addSubcommand(ReleaseSub());
  }

  @override
  final name = 'googleplay';

  @override
  final description = 'Google Play related commands';
}
