import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

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
import 'tracker/subject.dart';
import 'tracker/tracker.dart';

/// [SnowplowFlutterTracker]
/// The class which communicates with the current platform.
class SnowplowFlutterTracker {
  static final SnowplowFlutterTracker _singleton =
      SnowplowFlutterTracker._internal();
  static final MethodChannel _channel =
      MethodChannel('snowplow_flutter_tracker');

  /// Constructor which always returns the original instance of the class.
  factory SnowplowFlutterTracker() {
    return _singleton;
  }

  SnowplowFlutterTracker._internal();

  /// [initialize]
  /// The method which initializes the tracker instance of the current platform.
  Future<void> initialize(Tracker tracker) async {
    return await _channel.invokeMethod('initialize', tracker.toMap());
  }

  /// [setSubject]
  /// Sets the subject on the platform's tracker instance.
  Future<void> setSubject(Subject subject) async {
    return await _channel.invokeMethod('setSubject', subject.toMap());
  }

  /// [track]
  /// Tracks the given [event] parameter by the platform's tracker instance.
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
}
