import 'package:args/command_runner.dart';
import 'package:publisher/features/app_store_connect/app_store_connect.dart';

class AppStoreConnectCommand extends Command<dynamic> {
  AppStoreConnectCommand() {
    addSubcommand(ListProfilesSub());
    addSubcommand(InstallProfileSub());
  }

  @override
  final name = 'appstoreconnect';

  @override
  final description = 'App Store Connect related commands';
}
