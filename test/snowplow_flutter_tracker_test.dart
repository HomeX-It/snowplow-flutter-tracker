import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

void main() {
  const channel = MethodChannel('snowplow_flutter_tracker');
  final tracker = Tracker(
    emitter: Emitter(uri: 'uri'),
    appId: 'appID',
    namespace: 'namespace',
  );

  TestWidgetsFlutterBinding.ensureInitialized();

  group('[initialize]', () {
    test(
      "If tracker is not initialised, calls 'initialize' on platform channel",
      () async {
        var initialiseWasCalled = false;

        final sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          initialiseWasCalled = true;

          expect(methodCall.method, equals('initialize'));
          expect(methodCall.arguments, equals(tracker.toMap()));
          return;
        });

        await sut.initialize();

        expect(initialiseWasCalled, equals(true));
      },
    );

    test(
      'If tracker is already initialised, throws an exception',
      () async {
        var initialiseWasCalled = false;

        final sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          initialiseWasCalled = true;
          return;
        });

        try {
          await sut.initialize();
        } on SnowplowFlutterTrackerInitialisationError {
          expect(initialiseWasCalled, equals(false));
        } catch (_) {
          fail(
            'Expected SnowplowFlutterTrackerInitialisationError to be thrown',
          );
        }
      },
    );
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
