import 'dart:async';

import '../abstract_tracker.dart';
import '../../events/abstract_event.dart';

/// [ConsentualTracker]
/// Only tracks events if a pre-defined condition is met.
///
/// ConsentualTrackers can be used to block events from tracking
/// when the user has not consented to tracking.
class ConsentualTracker extends AbstractTracker {
  final AbstractTracker Function() _buildWrapped;
  final Stream<bool> _condition;

  StreamSubscription<bool>? _subscription;
  AbstractTracker? _wrapped;

  /// default initialiser
  ConsentualTracker(
    this._buildWrapped,
    this._condition,
  );

  @override
  Future<void> initialize() async {
    _subscription = _condition.listen(
      (userConsented) async {
        if (userConsented && _wrapped == null) {
          _wrapped = _buildWrapped();
          await _wrapped?.initialize();
        } else if (!userConsented) {
          await _wrapped?.destroy();
          _wrapped = null;
        }
      },
    );
  }

  @override
  Future<void> track(AbstractEvent event) async => await _wrapped?.track(event);

  @override
  Future<void> destroy() async {
    await _subscription?.cancel();
    _subscription = null;
    await _wrapped?.destroy();
    _wrapped = null;
  }
}
