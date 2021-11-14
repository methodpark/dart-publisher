import 'package:googleapis/androidpublisher/v3.dart';

import 'google_play.dart';
import 'model.dart';

class ReleaseSub extends GoogleCommand<Release> {
  ReleaseSub() {
    argParser.addOption(
      'packageName',
      abbr: 'n',
      mandatory: true,
      valueHelp: "x.x.x",
      help: "Package name of the app",
    );
    argParser.addOption(
      'releaseName',
      mandatory: false,
    );
    argParser.addOption(
      'releaseNotes',
      mandatory: false,
      help: "Release note en-GB by default",
    );
    argParser.addOption(
      'status',
      abbr: 's',
      mandatory: true,
      help:
          "Refer to https://developers.google.com/android-publisher/api-ref/rest/v3/edits.tracks#Status",
      allowed: [
        "statusUnspecified",
        "draft",
        "inProgress",
        "halted",
        "completed",
      ],
    );
    argParser.addOption(
      'track',
      abbr: 't',
      mandatory: true,
      help: "Refer to https://developers.google.com/android-publisher/tracks",
      allowed: [
        "internal",
        "alpha",
        "beta",
        "production",
      ],
    );
    argParser.addOption(
      'version',
      abbr: 'v',
      mandatory: true,
      help: "Represent application build code",
    );
  }

  @override
  final name = 'release';

  @override
  final description = 'Create a release';

  @override
  Release init() => Release(
        packageName: getArgResult('packageName')!,
        track: getArgResult('track')!,
        version: getArgResult('version')!,
        status: getArgResult('status')!,
        releaseName: getArgResult('releaseName'),
        releaseNotes: getArgResult('releaseNotes'),
      );

  @override
  Future<void> exec(Release arg) async {
    // create new edit instance
    final publisherApi = AndroidPublisherApi(client);
    final edits = publisherApi.edits;
    final editId = await generateEditId(edits, arg.packageName);

    // preparing update
    final tracks = resource.editTracks;
    await tracks.update(
      Track(
        track: arg.track,
        releases: [
          TrackRelease(
            status: arg.status,
            versionCodes: [arg.version],
            name: arg.releaseName,
            releaseNotes: [
              LocalizedText(
                language: 'en-GB',
                text: arg.releaseNotes,
              )
            ],
          )
        ],
      ),
      arg.packageName,
      editId,
      arg.track,
    );

    // commit edits
    edits.commit(arg.packageName, editId);
  }
}
