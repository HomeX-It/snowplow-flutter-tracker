import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

/// ⚠️ Important ⚠️: For now, isInitialised is a static field.
/// Therefore, the whole test suite needs to run in order,
/// so that the flag has the correct value at the time the test is run.
/// Make sure to not change the order of [initialize] and [close] tests
/// or else this test suite will break!
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
        expect(SnowplowFlutterTracker.isInitialized, equals(true));
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
          expect(SnowplowFlutterTracker.isInitialized, equals(true));
        } catch (_) {
          fail(
            'Expected SnowplowFlutterTrackerInitialisationError to be thrown',
          );
        }
      },
    );
  });

  group('[close]', () {
    test(
      "If tracker is initialised, calls 'close' on platform channel",
      () async {
        var closeWasCalled = false;

        final sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          closeWasCalled = true;

          expect(methodCall.method, equals('close'));
          return;
        });

        await sut.close();

        expect(closeWasCalled, equals(true));
        expect(SnowplowFlutterTracker.isInitialized, equals(false));
      },
    );

    test(
      "If tracker is not initialised, does not call 'close' on platform channel",
      () async {
        var closeWasCalled = false;

        final sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          closeWasCalled = true;
          expect(methodCall.method, equals('close'));
          return;
        });

        await sut.close();

        expect(closeWasCalled, equals(false));
        expect(SnowplowFlutterTracker.isInitialized, equals(false));
      },
    );
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
