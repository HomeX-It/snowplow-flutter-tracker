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
  const tracker = Tracker(
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

        const sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          initialiseWasCalled = true;

          expect(methodCall.method, equals('initialize'));
          expect(methodCall.arguments, equals(tracker.toMap()));
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

        const sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          initialiseWasCalled = true;
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

        const sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          closeWasCalled = true;

          expect(methodCall.method, equals('close'));
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

        const sut = SnowplowFlutterTracker(tracker);

        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          closeWasCalled = true;
          expect(methodCall.method, equals('close'));
        });

        await sut.close();

        expect(closeWasCalled, equals(false));
        expect(SnowplowFlutterTracker.isInitialized, equals(false));
      },
    );
  });

  test(
    '[setSubject] Calls setSubject on platform channel',
    () async {
      var setSubjectCalled = false;
      const subject = Subject(domainUserId: 'domainUserID');

      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        setSubjectCalled = true;

        expect(methodCall.method, equals('setSubject'));
        expect(methodCall.arguments, equals(subject.toMap()));
      });

      const sut = SnowplowFlutterTracker(tracker);

      await sut.setSubject(subject);

      expect(setSubjectCalled, equals(true));
    },
  );

  test(
    '[enableGDPRContext] Calls enableGDPRContext on platform channel',
    () async {
      var enableGDPRContextCalled = false;
      const gdprContext = GDPRContext(basis: GDPRLegalBasis.consent);

      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        enableGDPRContextCalled = true;

        expect(methodCall.method, equals('enableGdprContext'));
        expect(methodCall.arguments, equals(gdprContext.toMap()));
      });

      const sut = SnowplowFlutterTracker(tracker);

      await sut.enableGdprContext(gdprContext);

      expect(enableGDPRContextCalled, equals(true));
    },
  );

  test(
    '[disableGdprContext] Calls enableGDPRContext on platform channel',
    () async {
      var disableGdprContextCalled = false;

      channel.setMockMethodCallHandler((MethodCall methodCall) async {
        disableGdprContextCalled = true;

        expect(methodCall.method, equals('disableGdprContext'));
      });

      const sut = SnowplowFlutterTracker(tracker);

      await sut.disableGdprContext();

      expect(disableGdprContextCalled, equals(true));
    },
  );

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
