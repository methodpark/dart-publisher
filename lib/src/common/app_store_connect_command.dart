import 'dart:io';

import 'package:app_store_connect_apis/app_store_connect.dart';

import 'general_command.dart';

abstract class AppStoreConnectCommand extends GeneralCommand {
  final issuerEnvironmentVariable = 'APPLE_API_KEY_ISSUER';
  final keyIdEnvironmentVariable = 'APPLE_API_KEY_ID';
  final keyEnvironmentVariable = 'APPLE_API_KEY';

  late AppStoreConnect appStoreConnect;

  AppStoreConnectCommand() {
    Map<String, String> environmentVariables = Platform.environment;
    appStoreConnect = AppStoreConnect(
      environmentVariables[issuerEnvironmentVariable]!,
      environmentVariables[keyIdEnvironmentVariable]!,
      environmentVariables[keyEnvironmentVariable]!,
    );
  }
}
