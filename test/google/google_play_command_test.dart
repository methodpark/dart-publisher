import 'package:publisher/src/google/google_play_command.dart';
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
  });
}
