import 'package:meta/meta.dart';

import '../../events/abstract_event.dart';
import '../abstract_tracker.dart';

/// A [TrackingGuard] only forwards events
/// to its child if shouldTrack evaluates truthy.
@immutable
class TrackingGuard extends AbstractTracker {
  final AbstractTracker _child;
  final Future<bool> Function(AbstractEvent) _shouldTrack;

  /// Default initialiser
  const TrackingGuard({
    required AbstractTracker child,
    required Future<bool> Function(AbstractEvent) shouldTrack,
  })   : _child = child,
        _shouldTrack = shouldTrack;

  @override
  Future<void> initialize() => _child.initialize();

  @override
  Future<void> track(AbstractEvent event) async {
    if (await _shouldTrack(event)) {
      await _child.track(event);
    }
  }

  @override
  Future<void> close() => _child.close();
}
