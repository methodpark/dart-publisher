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

**Very important:** The following three environment variables are needed to be setup correctly:

- `APPLE_API_KEY` with the correct path to the p8 file that contains your API key
- `APPLE_API_KEY_ISSUER` with the issuer of the API key
- `APPLE_API_KEY_ID` the id of the API key

To get your authentication credentials, please follow the documentation by [Apple](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api).

## Guide

### List all provisioning profiles

```shell
publisher appstoreconnect listProfiles
```

### Install a specific provisioning profile (only on MacOS)

```shell
publisher appstoreconnect installProfile --profileId <your profile id>
```

## Pitfalls

### Google Play Related

If you see following error `Error 400: Only releases with status draft may be created on draft app` you first need to get your app out of the draft status.

This can be done by uploading manually a release to the `Closed Testing` track, that's it.

## Features and bugs

Please file feature requests and bugs at the issue [tracker](https://github.com/methodpark/dart-publisher/issues).
