import 'app_store_connect.dart';

class ListProfilesSub extends AppStoreConnectCommand<void> {
  @override
  final name = 'listProfiles';

  @override
  final description = 'Lists all provisioning profiles on the command line.';

  @override
  void init() {}

  @override
  Future<void> exec(void arg) async {
    final profiles = await appStoreConnect.getAllProfiles();
    print(profiles);
  }
}
