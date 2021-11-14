import 'dart:io';

import 'package:app_store_connect_apis/app_store_connect.dart';
import 'package:publisher/command/command.dart';

export 'install_profile_sub.dart';
export 'list_profiles_sub.dart';

abstract class AppStoreConnectCommand<T> extends GeneralCommand<T> {
  late AppStoreConnect appStoreConnect;

  static const appleApiKeyIssuerEnv = 'APPLE_API_KEY_ISSUER';
  static const appleApiKeyIdEnv = 'APPLE_API_KEY_ID';
  static const appleApiKeyEnv = 'APPLE_API_KEY';

  @override
  bool envCheck() {
    final Map<String, String> environmentVariables = Platform.environment;
    return environmentVariables.containsKey(appleApiKeyIssuerEnv) &&
        environmentVariables.containsKey(appleApiKeyIdEnv) &&
        environmentVariables.containsKey(appleApiKeyEnv);
  }

  @override
  Future<void> run() async {
    if (!envCheck()) {
      throw Exception('''
The following three environment variables are needed to be setup correctly:
[$appleApiKeyIssuerEnv] with the correct path to the p8 file that contains your API key
[$appleApiKeyIdEnv] with the issuer of the API key
[$appleApiKeyEnv] the id of the API key
''');
    }

    final Map<String, String> environmentVariables = Platform.environment;
    appStoreConnect = AppStoreConnect(
      environmentVariables[appleApiKeyIssuerEnv]!,
      environmentVariables[appleApiKeyIdEnv]!,
      environmentVariables[appleApiKeyEnv]!,
    );

    exec(init());
  }
}
