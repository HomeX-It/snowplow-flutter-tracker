import 'dart:async';
import 'package:flutter/foundation.dart';

import '../abstract_tracker.dart';
import '../../events/abstract_event.dart';

/// [ConsentualTracker]
/// Only tracks events if a pre-defined condition is met.
///
/// ConsentualTrackers can be used to block events from tracking
/// when the user has not consented to tracking.
class ConsentualTracker extends AbstractTracker {
  final AbstractTracker Function() _buildWrapped;
  final ValueNotifier<bool> _condition;

  AbstractTracker? _wrapped;

  /// default initialiser
  ConsentualTracker(
    this._buildWrapped,
    this._condition,
  );

  @override
  Future<void> initialize() async {
    _condition.addListener(_onConsentChange);
    _onConsentChange();
  }

  void _onConsentChange() async {
    final userConsented = _condition.value;
    if (userConsented && _wrapped == null) {
      _wrapped = _buildWrapped();
      await _wrapped?.initialize();
    } else if (!userConsented) {
      await _wrapped?.destroy();
      _wrapped = null;
    }
  }

  @override
  Future<void> track(AbstractEvent event) async => await _wrapped?.track(event);

  @override
  Future<void> destroy() async {
    _condition.removeListener(_onConsentChange);
    await _wrapped?.destroy();
    _wrapped = null;
  }
}
