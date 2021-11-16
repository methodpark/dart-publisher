import 'dart:io';

import 'package:app_store_connect_apis/app_store_connect.dart';

import 'general_command.dart';

abstract class AppleCommand extends GeneralCommand {
  final issuerEnvironmentVariable = 'APPLE_API_KEY_ISSUER';
  final keyIdEnvironmentVariable = 'APPLE_API_KEY_ID';
  final keyEnvironmentVariable = 'APPLE_API_KEY';

  AppStoreConnect createAppStoreConnectClient() {
    final String issuer =
        _getValidatedEnvironmentVariables(issuerEnvironmentVariable);

    final String keyId =
        _getValidatedEnvironmentVariables(keyIdEnvironmentVariable);

    final String keyFilePath =
        _getValidatedEnvironmentVariables(keyEnvironmentVariable);

    final appStoreConnect = AppStoreConnect(
      issuer,
      keyId,
      keyFilePath,
    );

    return appStoreConnect;
  }

  String _getValidatedEnvironmentVariables(String name) {
    final environmentVariable = Platform.environment[name];

    if (environmentVariable == null || environmentVariable.isEmpty) {
      throw Exception('The environment variable "' +
          name +
          '" is null or empty. Please set the environment variable.');
    }

    return environmentVariable;
  }
}
