import 'package:publisher/command/command.dart';
import 'package:test/test.dart';

void main() {
  group('Google Play Command:', () {
    test('constructor - default values - is initialized', () {
      final expectedName = 'googleplay';
      final expectedDescription = 'Google Play related commands';

      final command = GooglePlayCommand();

      expect(command.description, equals(expectedDescription));
      expect(command.name, equals(expectedName));
      expect(command.subcommands, isNotEmpty);
    });
  });
}
