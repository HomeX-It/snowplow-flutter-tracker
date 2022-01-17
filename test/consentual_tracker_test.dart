import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

import 'utils/mock_tracker.dart';

void main() {
  final event = ScreenView(name: 'name');

  group('[initialize]', () {
    test(
      'If consent is granted, underlying tracker is initialised',
      () async {
        final mock = MockTracker();

        final valueNotifier = ValueNotifier<bool>(false);

        final sut = ConsentualTracker(
          () => mock,
          valueNotifier,
        );

        await sut.initialize();

        expect(mock.initializeInvocationCounter, equals(0));

        valueNotifier.value = true;

        expect(mock.initializeInvocationCounter, equals(1));
      },
    );

    test(
      'If consent is revoked, underlying tracker is closed',
      () async {
        final mock = MockTracker();

        final valueNotifier = ValueNotifier<bool>(true);

        final sut = ConsentualTracker(
          () => mock,
          valueNotifier,
        );

        await sut.initialize();

        expect(mock.initializeInvocationCounter, equals(1));

        valueNotifier.value = false;

        expect(mock.closeInvocationCounter, equals(1));
      },
    );
  });

  test(
    '[setSubject] If consent is granted, ConsentualTracker sets subject on child tracker',
    () async {
      final mock = MockTracker();
      const subject = Subject();

      final valueNotifier = ValueNotifier<bool>(true);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();
      await sut.setSubject(subject);

      expect(mock.setSubjectInvocations, equals([subject]));
    },
  );

  test(
    '[enableGdprContext] If consent is granted, ConsentualTracker enables GPDR context on child tracker',
    () async {
      final mock = MockTracker();
      const context = GDPRContext(basis: GDPRLegalBasis.consent);

      final valueNotifier = ValueNotifier<bool>(true);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();
      await sut.enableGdprContext(context);

      expect(mock.enableGdprContextInvocations, equals([context]));
    },
  );

  test(
    '[disableGdprContext] If consent is granted, ConsentualTracker disables GPDR context',
    () async {
      final mock = MockTracker();
      final valueNotifier = ValueNotifier<bool>(true);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();

      await sut.disableGdprContext();

      expect(mock.disableGdprContextInvocationCount, equals(1));
    },
  );

  group('[track]', () {
    test(
      'If consent is granted, ConsentualTracker forwards events',
      () async {
        final mock = MockTracker();

        final valueNotifier = ValueNotifier<bool>(true);

        final sut = ConsentualTracker(
          () => mock,
          valueNotifier,
        );

        await sut.initialize();

        expect(mock.initializeInvocationCounter, equals(1));

        await sut.track(event);

        expect(mock.trackedEvents, equals([event]));
      },
    );

    test(
      'If consent is denied, ConsentualTracker does not forward events',
      () async {
        final mock = MockTracker();

        final valueNotifier = ValueNotifier<bool>(false);

        final sut = ConsentualTracker(
          () => mock,
          valueNotifier,
        );

        await sut.initialize();

        expect(mock.initializeInvocationCounter, equals(0));

        await sut.track(event);

        expect(mock.trackedEvents, equals([]));
      },
    );
  });
}
