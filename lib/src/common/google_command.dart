import 'package:_discoveryapis_commons/_discoveryapis_commons.dart';
import 'package:googleapis/androidpublisher/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart';

import 'general_command.dart';

abstract class GoogleCommand extends GeneralCommand {
  final requestHeaders = {
    'user-agent': 'google-api-dart-client/5.0.1',
    'x-goog-api-client': 'gl-dart/$dartVersion gdcl/5.0.1',
  };

  Future<AutoRefreshingAuthClient> createClient() {
    return clientViaApplicationDefaultCredentials(
        scopes: [AndroidPublisherApi.androidpublisherScope]);
  }

  Future<AppEdit> createAppEdit(Client client, String packageName) async {
    final publisherApi = AndroidPublisherApi(client);

    var edits = publisherApi.edits;

    return await edits.insert(AppEdit(), packageName);
  }

  Future<String> newEditId(EditsResource edits, String packageName) async {
    var newEdit = await edits.insert(AppEdit(), packageName);
    return newEdit.id.toString();
  }

  EditsTracksResource tracksResource(Client client) {
    ApiRequester requester = _createApiRequester(client);

    return EditsTracksResource(requester);
  }

  EditsBundlesResource bundlesResource(Client client) {
    ApiRequester requester = _createApiRequester(client);

    return EditsBundlesResource(requester);
  }

  ApiRequester _createApiRequester(Client client) {
    final requester = ApiRequester(
      client,
      'https://androidpublisher.googleapis.com/',
      '',
      requestHeaders,
    );
    return requester;
  }
}
