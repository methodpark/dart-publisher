import 'dart:io';

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart';
import 'package:googleapis/androidpublisher/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';
import 'package:publisher/command/command.dart';

export 'release_sub.dart';
export 'upload_bundle_sub.dart';

abstract class GoogleCommand<T> extends GeneralCommand<T> {
  late Client client;
  late GoogleResource resource;

  static const googleApplicationCredentialsEnv =
      "GOOGLE_APPLICATION_CREDENTIALS";

  @override
  bool envCheck() {
    final envs = Platform.environment;
    return envs.containsKey(googleApplicationCredentialsEnv);
  }

  @override
  Future<void> run() async {
    if (!envCheck()) {
      throw Exception(
          "The [$googleApplicationCredentialsEnv] environment variable is needed with the correct path to the JSON file that contains your service account key.");
    }

    try {
      final client = await createClient();
      resource = GoogleResource(client);
      await exec(init());
    } finally {
      client.close();
    }
  }

  Future<AutoRefreshingAuthClient> createClient() {
    return clientViaApplicationDefaultCredentials(scopes: [
      AndroidPublisherApi.androidpublisherScope,
    ]);
  }

  Future<AppEdit> createAppEdit(String packageName) async {
    final publisherApi = AndroidPublisherApi(client);
    final edits = publisherApi.edits;

    return await edits.insert(AppEdit(), packageName);
  }

  Future<String> generateEditId(EditsResource edits, String packageName) async {
    final edit = await edits.insert(AppEdit(), packageName);
    return edit.id.toString();
  }
}

class GoogleResource {
  GoogleResource(this.client);

  final Client client;

  static const apiRequester = 'https://androidpublisher.googleapis.com/';

  final requestHeaders = {
    'user-agent': 'google-api-dart-client/5.0.1',
    'x-goog-api-client': 'gl-dart/$dartVersion gdcl/5.0.1',
  };

  ApiRequester _createApiRequester() => ApiRequester(
        client,
        apiRequester,
        '',
        requestHeaders,
      );

  EditsTracksResource get editTracks {
    final ApiRequester requester = _createApiRequester();
    return EditsTracksResource(requester);
  }

  EditsBundlesResource get editsBundles {
    final ApiRequester requester = _createApiRequester();
    return EditsBundlesResource(requester);
  }
}
