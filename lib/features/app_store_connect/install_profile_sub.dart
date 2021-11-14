import 'dart:convert';
import 'dart:io';

import 'package:app_store_connect_apis/app_store_connect.dart';
import 'package:path/path.dart';

import 'app_store_connect.dart';
import 'model.dart';

class InstallProfileSub extends AppStoreConnectCommand<InstallProfile> {
  InstallProfileSub() {
    argParser.addOption('profileId', abbr: 'i', mandatory: true);
  }

  @override
  final name = 'installProfile';

  @override
  final description = 'Installs the specified provisining profile.';

  @override
  InstallProfile init() => InstallProfile(
        profileId: getArgResult('profileId')!,
      );

  @override
  Future<void> exec(InstallProfile arg) async {
    if (!Platform.isMacOS) {
      throw Exception(
          'The current used OS is not supported. Only MacOS is supported for this feature.');
    }

    final profile = await appStoreConnect.downloadProfile(arg.profileId);
    final profilePath = _generateFilePath(profile.uuid);
    await _writeProfileToFile(profile, profilePath);
  }

  Future<void> _writeProfileToFile(Profile profile, String filePath) async {
    try {
      final base = base64.decode(profile.content);
      await File(filePath).writeAsBytes(base);
    } catch (e) {
      print('Error occured while writing the profile file: ' + e.toString());
    }
  }

  String _generateFilePath(String profileUUID) {
    final Map<String, String> environmentVariables = Platform.environment;
    final homePath = environmentVariables['HOME']!;
    final fileName = '$profileUUID.mobileprovision';
    final folder = 'Library/MobileDevice/Provisioning Profiles';

    return join(homePath, folder, fileName);
  }
}
