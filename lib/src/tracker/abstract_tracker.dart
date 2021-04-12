import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

import '../events/abstract_event.dart';

/// [AbstractTracker]
/// An abstract tracker allows to track events
abstract class AbstractTracker {
  /// [track]
  /// Tracks the given [event] parameter by the platform's tracker instance.
  Future<void> track(AbstractEvent event);
}
