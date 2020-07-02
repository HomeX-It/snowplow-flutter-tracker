import 'dart:async';

import 'package:flutter/services.dart';

import 'package:snowplow_flutter_tracker/model/model.dart';

export 'model/model.dart';

/// [SnowplowFlutterTracker]
/// The class which communicates with the current platform.
class SnowplowFlutterTracker {
  static final SnowplowFlutterTracker _singleton = SnowplowFlutterTracker._internal();
  static final MethodChannel _channel = MethodChannel('snowplow_flutter_tracker');

  /// Constructor which always returns the original instance of the class.
  factory SnowplowFlutterTracker() {
    return _singleton;
  }

  SnowplowFlutterTracker._internal();

  /// [initialize]
  /// The method which initializes the tracker instance of the current platform.
  Future<void> initialize(Tracker tracker) async {
    return await _channel.invokeMethod<String>('initialize', tracker.toMap());
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
    } else if (event is PageView) {
      return await _channel.invokeMethod('trackPageView', event.toMap());
    } else if (event is EcommerceTransaction) {
      return await _channel.invokeMethod('trackEcommerceTransaction', event.toMap());
    } else if (event is ConsentGranted) {
      return await _channel.invokeMethod('trackConsentGranted', event.toMap());
    } else if (event is ConsentWithdrawn) {
      return await _channel.invokeMethod('trackConsentWithdrawn', event.toMap());
    } else if (event is PushNotification) {
      return await _channel.invokeMethod('trackPushNotification', event.toMap());
    } else {
      return await _channel.invokeMethod('trackTiming', event.toMap());
    }
  }
}
