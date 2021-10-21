# Publisher

<a href="https://github.com/methodpark/dart-publisher/actions?query=branch%3Amain"><img src="https://github.com/methodpark/dart-publisher/actions/workflows/github-actions.yml/badge.svg" alt="build status"></a>
<a href="https://pub.dev/packages/publisher"><img src="https://img.shields.io/pub/v/publisher.svg" alt="pub package"></a>
<a href="https://github.com/methodpark/dart-publisher/issues"><img src="https://img.shields.io/github/issues-raw/methodpark/dart-publisher" alt="open issues" /></a>

This is a dart tool for the release automation of cross-platform apps.

## Google Play

For using the Google Play features a Google Cloud service account with the correct permissions is needed. Have a look at the Google [documentation](https://cloud.google.com/docs/authentication/getting-started) for more information.

**Very important:** The `GOOGLE_APPLICATION_CREDENTIALS` environment variable is needed with the correct path to the JSON file that contains your service account key.

### Uploading an app bundle

```shell
publisher googleplay uploadBundle -p PATHTOAPPBUNDLE -n PACKAGENAME
```

### Create a new release

```shell
publisher googleplay release -n PACKAGENAME -t TRACK -v VERSION -s STATUS --releaseName RELEASENAME --releaseNotes NOTES
```

## App Store Connect

Not yet supported. Will be implemented soon.

## Features and bugs

Please file feature requests and bugs at the issue [tracker](https://github.com/methodpark/dart-publisher/issues).
