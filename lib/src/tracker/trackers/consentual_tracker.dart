import 'dart:async';
import 'package:flutter/foundation.dart';

import '../abstract_tracker.dart';
import '../gdpr_context.dart';
import '../subject.dart';
import '../../events/abstract_event.dart';

/// [ConsentualTracker]
/// Only tracks events if a pre-defined condition is met.
///
/// ConsentualTrackers can be used to block events from tracking
/// when the user has not consented to tracking.
class ConsentualTracker extends AbstractTracker {
  final AbstractTracker Function() _buildChild;
  final ValueNotifier<bool> _condition;

  AbstractTracker? _child;
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

  @override
  Future<void> setSubject(Subject subject) async =>
      await _child?.setSubject(subject);

  void _onConsentChange() async {
    final userConsented = _condition.value;
    if (userConsented && _child == null) {
      _child = _buildChild();
      await _child?.initialize();
    } else if (!userConsented) {
      await _child?.close();
      _child = null;
    }
  }

  @override
  Future<void> enableGdprContext(GDPRContext context) async =>
      await _child?.enableGdprContext(context);

  @override
  Future<void> disableGdprContext() async => await _child?.disableGdprContext();

  @override
  Future<void> track(AbstractEvent event) async => await _child?.track(event);

  @override
  Future<void> close() async {
    _condition.removeListener(_onConsentChange);
    await _child?.close();
    _child = null;
    _isInitialised = false;
  }
}
