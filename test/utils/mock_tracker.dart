import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

class MockTracker extends AbstractTracker {
  var initializeInvocationCounter = 0;
  @override
  Future<void> initialize() async {
    initializeInvocationCounter += 1;
  }

  var trackedEvents = <AbstractEvent>[];
  @override
  Future<void> track(AbstractEvent event) async {
    trackedEvents.add(event);
  }

  var closeInvocationCounter = 0;
  @override
  Future<void> close() async {
    closeInvocationCounter += 1;
  }
}
