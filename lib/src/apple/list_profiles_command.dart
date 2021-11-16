import '../common/apple_command.dart';

class ListProfiles extends AppleCommand {
  @override
  final name = 'listProfiles';

  @override
  final description = 'Lists all provisioning profiles on the command line.';

  @override
  Future<void> run() async {
    final appStoreConnect = createAppStoreConnectClient();

    var allProfiles = await appStoreConnect.getAllProfiles();

    print(allProfiles);
  }
}
