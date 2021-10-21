import 'dart:io';

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart';
import 'package:googleapis/androidpublisher/v3.dart';

import '../common/google_command.dart';

class UploadBundle extends GoogleCommand {
  @override
  final name = 'uploadBundle';

  @override
  final description = 'Uploads a new Android App Bundle.';

  UploadBundle() {
    argParser.addOption('bundlePath', abbr: 'p', mandatory: true);
    argParser.addOption('packageName', abbr: 'n', mandatory: true);
  }

  @override
  Future<void> run() async {
    final bundlePath = getArgResult('bundlePath')!;
    final packageName = getArgResult('packageName')!;

    final client = await createClient();

    try {
      final publisherApi = AndroidPublisherApi(client);
      var edits = publisherApi.edits;
      var editId = await newEditId(edits, packageName);

      final editsBundle = bundlesResource(client);

      var bundle = File(bundlePath);

      var media = Media(bundle.openRead(), bundle.lengthSync());

      await editsBundle.upload(packageName, editId, uploadMedia: media);

      edits.commit(packageName, editId);
    } finally {
      client.close();
    }
  }
}
