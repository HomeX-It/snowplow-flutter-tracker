import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const channel = MethodChannel('snowplow_flutter_tracker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  group('SnowplowFlutterTracker', () {
    test('Test', () {
      expect(true, true);
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
