import 'package:googleapis/androidpublisher/v3.dart';

import '../common/google_command.dart';

class Release extends GoogleCommand {
  @override
  final name = 'release';

  @override
  final description = 'Create a release';

  Release() {
    argParser.addOption('packageName', abbr: 'n', mandatory: true);
    argParser.addOption(
      'track',
      abbr: 't',
      mandatory: true,
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
      help: 'The version code of the APK, as specified in the manifest file.',
    );
    argParser.addOption(
      'status',
      abbr: 's',
      mandatory: true,
      allowed: [
        "draft",
        "inProgress",
        "halted",
        "completed",
      ],
    );
    argParser.addOption('releaseName', mandatory: false);
    argParser.addOption(
      'releaseNotes',
      mandatory: false,
      help: 'Localized release notes (en-GB).',
    );
  }

  @override
  Future<void> run() async {
    final packageName = getArgResult('packageName')!;
    final track = getArgResult('track')!;
    final version = getArgResult('version')!;
    final status = getArgResult('status')!;
    final releaseName = getArgResult('releaseName');
    final releaseNotes = getArgResult('releaseNotes');

    final client = await createClient();

    try {
      final publisherApi = AndroidPublisherApi(client);
      var edits = publisherApi.edits;
      var editId = await newEditId(edits, packageName);

      final tracks = tracksResource(client);

      await tracks.update(
          Track(track: track, releases: [
            TrackRelease(
                status: status,
                versionCodes: [version],
                name: releaseName,
                releaseNotes: [
                  LocalizedText(language: 'en-GB', text: releaseNotes)
                ])
          ]),
          packageName,
          editId,
          track);

      edits.commit(packageName, editId);
    } finally {
      client.close();
    }
  }
}
