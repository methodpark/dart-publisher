import 'package:publisher/src/apple/app_store_connect_command.dart';
import 'package:publisher/src/google/google_play_command.dart';
import 'package:publisher/src/publisher_command.dart';
import 'package:test/test.dart';

void main() {
  group('Publisher Command:', () {
    test('constructor - default values - is initialized', () {
      final executableName = 'publisher';
      final description = 'Tool for release automation of cross-platform apps';
      final usageFooter =
          'For more information have a look at the manual here: https://pub.dev/packages/publisher';

      final command = PublisherCommand();

      expect(command.executableName, equals(executableName));
      expect(command.description, equals(description));
      expect(command.usageFooter, equals(usageFooter));
      expect(command.commands, isNotEmpty);
    });

    test('constructor - default values - google play command is initialized',
        () {
      final expectedKey = 'googleplay';

      final command = PublisherCommand();

      expect(command.commands, containsPair(expectedKey, isA<GooglePlay>()));
    });

    test(
        'constructor - default values - app store connect command is initialized',
        () {
      final expectedKey = 'appstoreconnect';

      final command = PublisherCommand();

      expect(
          command.commands, containsPair(expectedKey, isA<AppStoreConnect>()));
    });
  });
}
