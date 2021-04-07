import 'package:flutter/foundation.dart';

import 'gdpr_context.dart';
import 'device_platforms.dart';
import 'log_level.dart';

import '../emitter/emitter.dart';

/// [Tracker] The tracker class.
/// This class is used for tracking events, and delegates them to other classes responsible for sending, storage, etc.
@immutable
class Tracker {
  /// [emitter] The emitter used by the tracker.
  final Emitter emitter;

  /// [namespace] The tracker's namespace.
  final String namespace;

  /// [appId] The tracker's app ID.
  final String appId;

  /// [base64] Whether events are Base64 encoded.
  final bool base64;

  /// [devicePlatform] The DevicePlatforms enum indicating the current platform.
  final DevicePlatforms devicePlatform;

  /// [logLevel] The LogLevel enum indication the current logging level.
  final LogLevel logLevel;

  /// [mobileContext] Whether mobile context is enabled.
  final bool mobileContext;

  /// [screenViewEvents] Whether to auto-track screen views.
  final bool screenViewEvents;

  /// [applicationContext] Whether application context is enabled.
  final bool applicationContext;

  /// [sessionContext] Whether session context is enabled.
  final bool sessionContext;

  /// [sessionCheckInterval] Length of time in seconds that session checks for timeout.
  final int sessionCheckInterval;

  /// [foregroundTimeout] Length of timeout in the foreground in seconds.
  final int foregroundTimeout;

  /// [backgroundTimeout] Length of timeout in the foreground in seconds.
  final int backgroundTimeout;

  /// [lifecycleEvents] Whether foreground and background events are enabled.
  final bool lifecycleEvents;

  /// [screenContext] Whether screen contexts are enabled.
  final bool screenContext;

  /// [screenContext] Whether exception events are tracked.
  /// On [iOS], setting true enables exception tracking.
  /// On [Android], setting true enables crash tracking.
  final bool exceptionEvents;

  /// [installTracking] Whether to autotrack application installs.
  final bool installTracking;

  /// [gdprContext] GDPR basis for processing and the details of a related document.
  final GDPRContext? gdprContext;

  /// Create a [Tracker] with default settings
  Tracker({
    required this.emitter,
    required this.namespace,
    required this.appId,
    this.base64 = false,
    this.devicePlatform = DevicePlatforms.mobile,
    this.logLevel = LogLevel.off,
    this.mobileContext = false,
    this.screenViewEvents = false,
    this.applicationContext = false,
    this.sessionContext = false,
    this.sessionCheckInterval = 15,
    this.foregroundTimeout = 600,
    this.backgroundTimeout = 300,
    this.lifecycleEvents = false,
    this.screenContext = false,
    this.exceptionEvents = false,
    this.installTracking = false,
    this.gdprContext,
  });

  /// [toMap] Converts the tracker object to JSON.
  Map<String, Object?> toMap() {
    return <String, Object?>{
      'emitter': emitter.toMap(),
      'namespace': namespace,
      'appId': appId,
      'base64': base64,
      'devicePlatform': devicePlatform.name,
      'logLevel': logLevel.name,
      'mobileContext': mobileContext,
      'screenviewEvents': screenViewEvents,
      'applicationContext': applicationContext,
      'sessionContext': sessionContext,
      'sessionCheckInterval': sessionCheckInterval,
      'foregroundTimeout': foregroundTimeout,
      'backgroundTimeout': backgroundTimeout,
      'lifecycleEvents': lifecycleEvents,
      'screenContext': screenContext,
      'exceptionEvents': exceptionEvents,
      'installTracking': installTracking,
      'gdprContext': gdprContext?.toMap(),
    };
  }
}
