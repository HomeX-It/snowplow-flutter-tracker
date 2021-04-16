import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

class MockTracker extends AbstractTracker {
  var initializeInvocationCounter = 0;
  @override
  Future<void> initialize() async {
    initializeInvocationCounter += 1;
  }

  var setSubjectInvocations = <Subject>[];
  @override
  Future<void> setSubject(Subject subject) async {
    setSubjectInvocations.add(subject);
  }

  var enableGdprContextInvocations = <GDPRContext>[];
  @override
  Future<void> enableGdprContext(GDPRContext context) async {
    enableGdprContextInvocations.add(context);
  }

  var disableGdprContextInvocationCount = 0;
  @override
  Future<void> disableGdprContext() async {
    disableGdprContextInvocationCount += 1;
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
