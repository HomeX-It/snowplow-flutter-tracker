import 'device_platforms.dart';
import 'log_level.dart';

import '../emitter/emitter.dart';

/// [Tracker] The tracker class.
/// This class is used for tracking events, and delegates them to other classes responsible for sending, storage, etc.
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

  Tracker._builder(TrackerBuilder builder)
      : emitter = builder._emitter,
        namespace = builder._namespace,
        appId = builder._appId,
        base64 = builder._base64,
        devicePlatform = builder._devicePlatform,
        logLevel = builder._logLevel,
        mobileContext = builder._mobileContext,
        screenViewEvents = builder._screenViewEvents,
        applicationContext = builder._applicationContext,
        sessionContext = builder._sessionContext,
        sessionCheckInterval = builder._sessionCheckInterval,
        foregroundTimeout = builder._foregroundTimeout,
        backgroundTimeout = builder._backgroundTimeout,
        lifecycleEvents = builder._lifecycleEvents,
        screenContext = builder._screenContext,
        exceptionEvents = builder._exceptionEvents,
        installTracking = builder._installTracking;

  /// [toMap] Converts the tracker object to JSON.
  Map<String, Object> toMap() {
    return <String, dynamic>{
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
      'installTracking': installTracking,
      'exceptionEvents': exceptionEvents
    };
  }
}

/// [TrackerBuilder] The builder for [Tracker]
/// The protocol for building tracker.
class TrackerBuilder {
  Emitter _emitter;
  String _namespace;
  String _appId;
  bool _base64;
  DevicePlatforms _devicePlatform;
  LogLevel _logLevel;
  bool _mobileContext;
  bool _screenViewEvents;
  bool _applicationContext;
  bool _sessionContext;
  int _sessionCheckInterval;
  int _foregroundTimeout;
  int _backgroundTimeout;
  bool _lifecycleEvents;
  bool _screenContext;
  bool _installTracking;
  bool _exceptionEvents;

  /// Builder constructor with required parameters, [emitter], [namespace] and [appId].
  TrackerBuilder(Emitter emitter, String namespace, String appId) {
    _emitter = emitter;
    _namespace = namespace;
    _appId = appId;
    _base64 = false;
    _devicePlatform = DevicePlatforms.Mobile;
    _logLevel = LogLevel.OFF;
    _mobileContext = false;
    _screenViewEvents = false;
    _applicationContext = false;
    _sessionContext = false;
    _sessionCheckInterval = 15;
    _foregroundTimeout = 600;
    _backgroundTimeout = 300;
    _lifecycleEvents = false;
    _screenContext = false;
    _installTracking = false;
    _exceptionEvents = false;
  }

  /// [setBase64] Tracker builder method to set whether events will be sent Base64 encoded.
  TrackerBuilder setBase64(bool base64) {
    _base64 = base64;
    return this;
  }

  /// [setDevicePlatform] Tracker builder method to set the device platform the tracker is running on.
  TrackerBuilder setDevicePlatform(DevicePlatforms devicePlatform) {
    _devicePlatform = devicePlatform;
    return this;
  }

  /// [setLogLevel] Tracker builder method to set the logging level.
  TrackerBuilder setLogLevel(LogLevel logLevel) {
    _logLevel = logLevel;
    return this;
  }

  /// [setMobileContext] Tracker builder method to set whether events will include mobile context.
  TrackerBuilder setMobileContext(bool mobileContext) {
    _mobileContext = mobileContext;
    return this;
  }

  /// [setScreenViewEvents] Tracker builder method to set whether screen views will be auto-tracked.
  TrackerBuilder setScreenViewEvents(bool screenViewEvents) {
    _screenViewEvents = screenViewEvents;
    return this;
  }

  /// [setApplicationContext] Tracker builder method to set whether events will include application context.
  TrackerBuilder setApplicationContext(bool applicationContext) {
    _applicationContext = applicationContext;
    return this;
  }

  /// [setSessionContext] Tracker builder method to set whether events will include session context.
  TrackerBuilder setSessionContext(bool sessionContext) {
    _sessionContext = sessionContext;
    return this;
  }

  /// [setSessionCheckInterval] Tracker builder method to set the interval of session checking.
  @Deprecated(
    '\'setCheckInterval\' is deprecated: setCheckInterval is deprecated as no longer has any effect.',
  )
  TrackerBuilder setSessionCheckInterval(int sessionCheckInterval) {
    _sessionCheckInterval = sessionCheckInterval;
    return this;
  }

  /// [setForegroundTimeout] Tracker builder method to set the foreground timeout.
  TrackerBuilder setForegroundTimeout(int foregroundTimeout) {
    _foregroundTimeout = foregroundTimeout;
    return this;
  }

  /// [setBackgroundTimeout] Tracker builder method to set the background timeout.
  TrackerBuilder setBackgroundTimeout(int backgroundTimeout) {
    _backgroundTimeout = backgroundTimeout;
    return this;
  }

  /// [setLifecycleEvents] Tracker builder method to set whether foreground and background events are sent on app suspend and resume.
  TrackerBuilder setLifecycleEvents(bool lifecycleEvents) {
    _lifecycleEvents = lifecycleEvents;
    return this;
  }

  /// [setScreenContext] Tracker builder method to set whether screen contexts will be added to all events.
  TrackerBuilder setScreenContext(bool screenContext) {
    _screenContext = screenContext;
    return this;
  }

  /// [setInstallTracking] Tracker builder method to set whether application install should be autotracked.
  TrackerBuilder setInstallTracking(bool installTracking) {
    _installTracking = installTracking;
    return this;
  }

  /// [setExceptionEvents] Tracker builder method to set whether exception events should get tracked automatically.
  /// On [iOS], enabling this tracks any unhandled exceptions.
  /// On [Android], this option enables crash tracking.
  TrackerBuilder setExceptionEvents(bool exceptionEvents) {
    _exceptionEvents = exceptionEvents;
    return this;
  }

  /// [build] Creates a tracker.
  Tracker build() {
    return Tracker._builder(this);
  }
}
