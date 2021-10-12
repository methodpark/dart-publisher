import 'dart:io';

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart';
import 'package:args/command_runner.dart';
import 'package:googleapis/androidpublisher/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class UploadBundle extends Command<dynamic> {
  @override
  final name = 'uploadBundle';

  @override
  final description = 'Uploads a new Android App Bundle.';

  UploadBundle() {
    argParser.addOption('bundlePath', abbr: 'p', mandatory: true);
    argParser.addOption('packageName', abbr: 'n', mandatory: true);
  }

  final _requestHeaders = {
    'user-agent': 'google-api-dart-client/5.0.1',
    'x-goog-api-client': 'gl-dart/$dartVersion gdcl/5.0.1',
  };

  @override
  Future<void> run() async {
    final bundlePath = argResults!['bundlePath'].toString();
    final packageName = argResults!['packageName'].toString();

    final httpClient = await clientViaApplicationDefaultCredentials(
        scopes: [AndroidPublisherApi.androidpublisherScope]);

    try {
      final publisherApi = AndroidPublisherApi(httpClient);

      var edits = publisherApi.edits;

      var newEdit = await edits.insert(AppEdit(), packageName);

      final requester = ApiRequester(httpClient,
          'https://androidpublisher.googleapis.com/', '', _requestHeaders);

      final editsBundle = EditsBundlesResource(requester);

      var bundle = File(bundlePath);

      var media = Media(bundle.openRead(), bundle.lengthSync());

      await editsBundle.upload(packageName, newEdit.id.toString(),
          uploadMedia: media);

      edits.commit(packageName, newEdit.id.toString());
    } finally {
      httpClient.close();
    }
  }
}
