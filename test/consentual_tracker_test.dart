import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

class MockTracker extends AbstractTracker {
  var trackedEvents = <AbstractEvent>[];

  @override
  Future<void> track(AbstractEvent event) async {
    trackedEvents.add(event);
  }
}

void main() {
  final event = ScreenView(name: 'name');

  test(
    'If condition is true, ConsentualTracker forwards events',
    () async {
      final mock = MockTracker();

      final sut = ConsentualTracker(
        mock,
        () async => true,
      );

      await sut.track(event);

      expect(mock.trackedEvents, equals([event]));
    },
  );

  test(
    'If condition is false, ConsentualTracker does not forward events',
    () async {
      final mock = MockTracker();

      final sut = ConsentualTracker(
        mock,
        () async => false,
      );

      await sut.track(event);

      expect(mock.trackedEvents, equals([]));
    },
  );
}
