import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

import 'utils/mock_tracker.dart';

void main() {
  final event = ScreenView(name: 'name');

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
}
