import 'package:publisher/src/apple/app_store_connect_command.dart';
import 'package:publisher/src/apple/install_profile_command.dart';
import 'package:publisher/src/apple/list_profiles_command.dart';
import 'package:test/test.dart';

void main() {
  group('App Store Connect Command:', () {
    test('constructor - default values - is initialized', () {
      var expectedName = 'appstoreconnect';
      var expectedDescription = 'App Store Connect related commands';

      var command = AppStoreConnect();

      expect(command.description, equals(expectedDescription));
      expect(command.name, equals(expectedName));
      expect(command.subcommands, isNotEmpty);
    });

    test('constructor - default values - list profiles command is initialized',
        () {
      final expectedKey = 'listProfiles';

      final command = AppStoreConnect();

      expect(
          command.subcommands, containsPair(expectedKey, isA<ListProfiles>()));
    });

    test(
        'constructor - default values - install profile command is initialized',
        () {
      final expectedKey = 'installProfile';

      final command = AppStoreConnect();

      expect(command.subcommands,
          containsPair(expectedKey, isA<InstallProfile>()));
    });
  });
}
