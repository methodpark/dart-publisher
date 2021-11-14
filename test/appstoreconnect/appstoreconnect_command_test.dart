import 'package:publisher/command/command.dart';
import 'package:test/test.dart';

void main() {
  group('App Store Connect Command:', () {
    test('constructor - default values - is initialized', () {
      final expectedName = 'appstoreconnect';
      final expectedDescription = 'App Store Connect related commands';

      final command = AppStoreConnectCommand();

      expect(command.description, equals(expectedDescription));
      expect(command.name, equals(expectedName));
      expect(command.subcommands, isNotEmpty);
    });
  });
}
