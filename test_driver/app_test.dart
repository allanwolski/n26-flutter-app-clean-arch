import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('N26 AppBar Title check', () {
    late FlutterDriver driver;
    final appBarFinder = find.byValueKey('app_bar_title');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('starts at Home', () async {
      expect(await driver.getText(appBarFinder), 'Home');
    });

    test('change to the Spaces tab bar', () async {
      await driver.waitFor(find.byValueKey('bottom_navigation_bar'));
      await driver.tap(find.text('Spaces'));

      expect(await driver.getText(appBarFinder), 'Spaces');
    });

    test('change to the Explore tab bar', () async {
      await driver.waitFor(find.byValueKey('bottom_navigation_bar'));
      await driver.tap(find.text('Explore'));

      expect(await driver.getText(appBarFinder), 'Explore');
    });

    test('change to the Actions tab bar', () async {
      await driver.waitFor(find.byValueKey('bottom_navigation_bar'));
      await driver.tap(find.text('Actions'));

      expect(await driver.getText(appBarFinder), 'Actions');
    });
  });
}
