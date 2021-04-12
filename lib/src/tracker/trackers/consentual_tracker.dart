import 'package:meta/meta.dart';

import '../abstract_tracker.dart';
import '../../events/abstract_event.dart';

/// [ConsentualTracker]
/// Only tracks events if a pre-defined condition is met.
///
/// ConsentualTrackers can be used to block events from tracking
/// when the user has not consented to tracking.
@immutable
class ConsentualTracker extends AbstractTracker {
  final AbstractTracker _wrapped;
  final Future<bool> Function() _condition;

  /// default initialiser
  const ConsentualTracker(
    this._wrapped,
    this._condition,
  );

  @override
  Future<void> track(AbstractEvent event) async {
    if (await _condition()) {
      return _wrapped.track(event);
    }
  }
}
