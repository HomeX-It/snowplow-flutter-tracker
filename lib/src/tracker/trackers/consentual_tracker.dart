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
  final AbstractTracker Function() _buildChild;
  final ValueNotifier<bool> _condition;

  AbstractTracker? _wrapped;
  bool _isInitialised = false;

  /// default initialiser
  ConsentualTracker(
    this._buildChild,
    this._condition,
  );

  @override
  Future<void> initialize() async {
    if (!_isInitialised) {
      _condition.addListener(_onConsentChange);
      _onConsentChange();
      _isInitialised = true;
    }
  }

  void _onConsentChange() async {
    final userConsented = _condition.value;
    if (userConsented && _wrapped == null) {
      _wrapped = _buildChild();
      await _wrapped?.initialize();
    } else if (!userConsented) {
      await _wrapped?.close();
      _wrapped = null;
    }
  }

  @override
  Future<void> track(AbstractEvent event) async => await _wrapped?.track(event);

  @override
  Future<void> close() async {
    _condition.removeListener(_onConsentChange);
    await _wrapped?.close();
    _wrapped = null;
    _isInitialised = false;
  }
}
