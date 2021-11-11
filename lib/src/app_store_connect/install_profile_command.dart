import 'dart:convert';
import 'dart:io';

import 'package:app_store_connect_apis/app_store_connect.dart';
import 'package:path/path.dart';

import '../common/app_store_connect_command.dart';

class InstallProfile extends AppStoreConnectCommand {
  @override
  final name = 'installProfile';

  @override
  final description = 'Installs the specified provisining profile.';

  InstallProfile() {
    argParser.addOption('profileId', abbr: 'i', mandatory: true);
  }

  @override
  Future<void> run() async {
    if (!Platform.isMacOS) {
      throw Exception(
          'The current used OS is not supported. Only MacOS is supported for this feature.');
    }

    final profileId = getArgResult('profileId')!;

    var profile = await appStoreConnect.downloadProfile(profileId);

    await _writeProfileToFile(profile);
  }

  Future<void> _writeProfileToFile(Profile profile) async {
    String filePath = _generateFilePath(profile);

    var base = base64.decode(profile.content);

    try {
      await File(filePath).writeAsBytes(base);
    } catch (e) {
      print('Error occured while writing the profile file: ' + e.toString());
    }
  }

  String _generateFilePath(Profile profile) {
    Map<String, String> environmentVariables = Platform.environment;
    final homePath = environmentVariables['HOME']!;
    final fileName = profile.uuid + '.mobileprovision';
    final folder = 'Library/MobileDevice/Provisioning Profiles';

    final filePath = join(homePath, folder, fileName);

    return filePath;
  }
}
