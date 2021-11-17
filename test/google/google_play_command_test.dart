import 'package:publisher/src/google/google_play_command.dart';
import 'package:publisher/src/google/release_command.dart';
import 'package:publisher/src/google/upload_bundle_command.dart';
import 'package:test/test.dart';

void main() {
  group('Google Play Command:', () {
    test('constructor - default values - is initialized', () {
      var expectedName = 'googleplay';
      var expectedDescription = 'Google Play related commands';

      var command = GooglePlay();

      expect(command.description, equals(expectedDescription));
      expect(command.name, equals(expectedName));
      expect(command.subcommands, isNotEmpty);
    });

    test('constructor - default values - upload bundle command is initialized',
        () {
      final expectedKey = 'uploadBundle';

      final command = GooglePlay();

      expect(
          command.subcommands, containsPair(expectedKey, isA<UploadBundle>()));
    });

    test('constructor - default values - release command is initialized', () {
      final expectedKey = 'release';

      final command = GooglePlay();

      expect(command.subcommands, containsPair(expectedKey, isA<Release>()));
    });
  });
}
