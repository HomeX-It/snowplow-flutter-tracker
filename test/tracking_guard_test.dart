import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

import 'utils/mock_tracker.dart';

void main() {
  final event = ScreenView(name: 'name');

  test('[initialize] Calls initialize on child tracker', () async {
    final mock = MockTracker();

    final sut = TrackingGuard(
      child: mock,
      shouldTrack: (_) async => true,
    );

    await sut.initialize();

    expect(mock.initializeInvocationCounter, equals(1));
  });

  test('[setSubject] Calls setSubject on child tracker', () async {
    final mock = MockTracker();
    final subject = Subject();

    final sut = TrackingGuard(
      child: mock,
      shouldTrack: (_) async => true,
    );

    await sut.setSubject(subject);

    expect(mock.setSubjectInvocations, equals([subject]));
  });

  test(
    '[enableGdprContext] Calls enableGdprContext on child tracker',
    () async {
      final mock = MockTracker();
      final context = GDPRContext(basis: GDPRLegalBasis.consent);

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
      'If condition is true, TrackingGuard forwards events',
      () async {
        final mock = MockTracker();

        final sut = TrackingGuard(
          child: mock,
          shouldTrack: (_) async => true,
        );

        await sut.track(event);

        expect(mock.trackedEvents, equals([event]));
      },
    );

    test(
      'If condition is false, TrackingGuard does not forward events',
      () async {
        final mock = MockTracker();

        final sut = TrackingGuard(
          child: mock,
          shouldTrack: (_) async => false,
        );

        await sut.track(event);

        expect(mock.trackedEvents, equals([]));
      },
    );
  });

  test('[close] Calls close on child tracker', () async {
    final mock = MockTracker();

    final sut = TrackingGuard(
      child: mock,
      shouldTrack: (_) async => true,
    );

    await sut.close();

    expect(mock.closeInvocationCounter, equals(1));
  });
}
