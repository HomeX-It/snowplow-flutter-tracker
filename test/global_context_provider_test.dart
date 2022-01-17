import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

import 'utils/mock_tracker.dart';

void main() {
  final event = ScreenView(name: 'name', contexts: const {});

  const context = SelfDescribingJson(
    payload: {},
    schema: 'schema',
  );

  final expectedEvent = ScreenView(
    name: 'name',
    contexts: {context},
  );

  test('[initialize] Calls initialize on child tracker', () async {
    final mock = MockTracker();

    final sut = GlobalContextProvider(
      child: mock,
      buildContext: () async => context,
    );

    await sut.initialize();

    expect(mock.initializeInvocationCounter, equals(1));
  });

  test(
    '[setSubject] Calls setSubject on child tracker',
    () async {
      final mock = MockTracker();
      const subject = Subject();

      final sut = TrackingGuard(
        child: mock,
        shouldTrack: (_) async => true,
      );

      await sut.setSubject(subject);

      expect(mock.setSubjectInvocations, equals([subject]));
    },
  );

  test(
    '[enableGdprContext] Calls enableGdprContext on child tracker',
    () async {
      final mock = MockTracker();
      const context = GDPRContext(basis: GDPRLegalBasis.consent);

      final sut = TrackingGuard(
        child: mock,
        shouldTrack: (_) async => true,
      );

      await sut.enableGdprContext(context);

      expect(mock.enableGdprContextInvocations, equals([context]));
    },
  );

  test(
    '[disableGdprContext] Calls disableGdprContext on child tracker',
    () async {
      final mock = MockTracker();

      final sut = TrackingGuard(
        child: mock,
        shouldTrack: (_) async => true,
      );

      await sut.disableGdprContext();

      expect(mock.disableGdprContextInvocationCount, equals(1));
    },
  );

  group('[track]', () {
    test(
        'Attaches global context to all events, if no shouldAttachTo is provided',
        () async {
      final mock = MockTracker();

      final sut = GlobalContextProvider(
        child: mock,
        buildContext: () async => context,
      );

      await sut.track(event);

      expect(
        mock.trackedEvents,
        equals([expectedEvent]),
      );
    });

    test(
        'Attaches global context to tracked events, if truthy shouldAttachTo is provided',
        () async {
      final mock = MockTracker();

      final sut = GlobalContextProvider(
        child: mock,
        shouldAttachTo: (_) => true,
        buildContext: () async => context,
      );

      await sut.track(event);

      expect(
        mock.trackedEvents,
        equals([expectedEvent]),
      );
    });

    test(
        'Does not attach global context to tracked events, if falsy shouldAttachTo is provided',
        () async {
      final mock = MockTracker();

      const context = SelfDescribingJson(
        payload: {},
        schema: 'schema',
      );

      final sut = GlobalContextProvider(
        child: mock,
        shouldAttachTo: (_) => false,
        buildContext: () async => context,
      );

      await sut.track(event);

      expect(
        mock.trackedEvents,
        equals([event]),
      );
    });
  });

  test('[close] Calls close on child tracker', () async {
    final mock = MockTracker();

    final sut = GlobalContextProvider(
      child: mock,
      buildContext: () async => context,
    );

    await sut.close();

    expect(mock.closeInvocationCounter, equals(1));
  });
}
