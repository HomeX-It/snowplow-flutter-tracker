import 'dart:async';

import 'package:flutter/services.dart';

import 'package:snowplow_flutter_tracker/model/model.dart';

export 'model/model.dart';

class SnowplowFlutterTracker {
  static final SnowplowFlutterTracker _singleton = SnowplowFlutterTracker._internal();
  static final MethodChannel _channel = MethodChannel('snowplow_flutter_tracker');

  factory SnowplowFlutterTracker() {
    return _singleton;
  }

  SnowplowFlutterTracker._internal();

  Future<void> initialize(Tracker tracker) async {
    return await _channel.invokeMethod<String>('initialize', tracker.toMap());
  }

  Future<void> setSubject(Subject subject) async {
    return await _channel.invokeMethod('setSubject', subject.toMap());
  }

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
    } else {
      return await _channel.invokeMethod('trackTiming', event.toMap());
    }
  }
}
