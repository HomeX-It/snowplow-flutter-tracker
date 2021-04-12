import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import 'events/abstract_event.dart';
import 'events/consent_granted.dart';
import 'events/consent_withdrawn.dart';
import 'events/ecommerce_transaction.dart';
import 'events/page_view.dart';
import 'events/push_notification.dart';
import 'events/screen_view.dart';
import 'events/self_describing.dart';
import 'events/structured.dart';
import 'events/timing.dart';
import 'tracker/abstract_tracker.dart';
import 'tracker/subject.dart';
import 'tracker/tracker.dart';

/// [SnowplowFlutterTrackerInitialisationError]
///
class SnowplowFlutterTrackerInitialisationError extends Error {
  /// Snowplow tracker is already initialised.
  /// .initialize() should only be called once, on the outermost tracker.
  SnowplowFlutterTrackerInitialisationError.alreadyInitialized();
}

/// [SnowplowFlutterTracker]
/// The class which communicates with the current platform.
@immutable
class SnowplowFlutterTracker extends AbstractTracker {
  static final MethodChannel _channel =
      MethodChannel('snowplow_flutter_tracker');
  static var _isInitialized = false;

  final Tracker _tracker;

  /// Constructor which always returns the original instance of the class.
  const SnowplowFlutterTracker(this._tracker);

  /// [initialize]
  /// The method which initializes the tracker instance of the current platform.
  @override
  Future<void> initialize() async {
    if (_isInitialized) {
      SnowplowFlutterTracker._isInitialized = true;
      await _channel.invokeMethod('initialize', _tracker.toMap());
    } else {
      throw SnowplowFlutterTrackerInitialisationError.alreadyInitialized();
    }
  }

  /// [setSubject]
  /// Sets the subject on the platform's tracker instance.
  Future<void> setSubject(Subject subject) async {
    return await _channel.invokeMethod('setSubject', subject.toMap());
  }

  @override
  Future<void> track(AbstractEvent event) async {
    if (event is SelfDescribing) {
      return await _channel.invokeMethod('trackSelfDescribing', event.toMap());
    } else if (event is Structured) {
      return await _channel.invokeMethod('trackStructured', event.toMap());
    } else if (event is ScreenView) {
      return await _channel.invokeMethod('trackScreenView', event.toMap());
    } else if (event is PageViewEvent) {
      return await _channel.invokeMethod('trackPageView', event.toMap());
    } else if (event is EcommerceTransaction) {
      return await _channel.invokeMethod(
          'trackEcommerceTransaction', event.toMap());
    } else if (event is ConsentGranted) {
      return await _channel.invokeMethod('trackConsentGranted', event.toMap());
    } else if (event is ConsentWithdrawn) {
      return await _channel.invokeMethod(
          'trackConsentWithdrawn', event.toMap());
    } else if (event is PushNotification) {
      if (Platform.isIOS) {
        return await _channel.invokeMethod(
            'trackPushNotification', event.toMap());
      }
    } else if (event is Timing) {
      return await _channel.invokeMethod('trackTiming', event.toMap());
    } else {
      throw ArgumentError('$event is not valid');
    }
  }

  @override
  Future<void> destroy() async {
    return _channel.invokeMethod('destroy');
  }
}
