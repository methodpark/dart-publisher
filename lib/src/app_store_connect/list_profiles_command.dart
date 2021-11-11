import 'package:publisher/src/common/app_store_connect_command.dart';

class ListProfiles extends AppStoreConnectCommand {
  @override
  final name = 'listProfiles';

  @override
  final description = 'Lists all provisioning profiles on the command line.';

  @override
  Future<void> run() async {
    var allProfiles = await appStoreConnect.getAllProfiles();

    print(allProfiles);
  }
}
