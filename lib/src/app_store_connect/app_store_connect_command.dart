import 'package:args/command_runner.dart';

import 'install_profile_command.dart';
import 'list_profiles_command.dart';

class AppStoreConnect extends Command<dynamic> {
  @override
  final name = 'appstoreconnect';
  @override
  final description = 'App Store Connect related commands';

  AppStoreConnect() {
    addSubcommand(ListProfiles());
    addSubcommand(InstallProfile());
  }
}
