import 'dart:io';

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart';
import 'package:googleapis/androidpublisher/v3.dart';

import 'google_play.dart';
import 'model.dart';

class UploadBundleSub extends GoogleCommand<UploadBundle> {
  UploadBundleSub() {
    argParser.addOption('bundlePath', abbr: 'p', mandatory: true);
    argParser.addOption('packageName', abbr: 'n', mandatory: true);
  }

  @override
  final name = 'uploadBundle';

  @override
  final description = 'Uploads a new Android App Bundle.';

  @override
  UploadBundle init() => UploadBundle(
        packageName: getArgResult('packageName')!,
        bundlePath: getArgResult('bundlePath')!,
      );

  @override
  Future<void> exec(UploadBundle arg) async {
    // create new edit instance
    final publisherApi = AndroidPublisherApi(client);
    final edits = publisherApi.edits;
    final editId = await generateEditId(edits, arg.packageName);

    // get bundle .aab from disk
    final bundle = File(arg.bundlePath);
    final media = Media(bundle.openRead(), bundle.lengthSync());

    // get google resource
    final editsBundle = resource.editsBundles;
    await editsBundle.upload(arg.packageName, editId, uploadMedia: media);

    // commit edits
    edits.commit(arg.packageName, editId);
  }
}
