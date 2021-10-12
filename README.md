# Publisher

![Build Status](https://github.com/methodpark/dart-publisher/actions/workflows/github-actions/badge.svg)

This is a dart tool for the release automation of cross-platform apps.

The installation can be done easily as a global command line tool with the following statement:

```shell
dart pub global activate publisher
```

## Google Play

For using the Google Play features a Google Cloud service account with the correct permissions is needed. Have a look at the Google [documentation](https://cloud.google.com/docs/authentication/getting-started) for more information.

**Very important:** The `GOOGLE_APPLICATION_CREDENTIALS` environment variable is needed with the correct path to the JSON file that contains your service account key.

### Uploading an app bundle

```shell
publisher googleplay uploadBundle -p PATHTOAPPBUNDLE -n PACKAGENAME
```

## App Store Connect

Not yet supported. Will be implemented soon.

## Features and bugs

Please file feature requests and bugs at the issue [tracker](https://github.com/methodpark/dart-publisher/issues).
