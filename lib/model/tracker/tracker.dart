import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/emitter/emitter.dart';
import 'package:snowplow_flutter_tracker/model/tracker/device_platforms.dart';
import 'package:snowplow_flutter_tracker/model/tracker/log_level.dart';

class Tracker {
	final Emitter emitter;
	final String namespace;
	final String appId;
	final bool base64;
	final DevicePlatforms devicePlatform;
	final LogLevel logLevel;
	final bool mobileContext;
	final bool screenViewEvents;
	final bool applicationContext;
	final bool sessionContext;
	final int sessionCheckInterval;
	final int foregroundTimeout;
	final int backgroundTimeout;
	final bool lifecycleEvents;
	final bool screenContext;
	final bool installTracking;

	const Tracker({
		@required this.emitter,
		@required this.namespace,
		@required this.appId,
		bool base64,
		DevicePlatforms devicePlatform,
		LogLevel logLevel,
		bool mobileContext,
		bool screenViewEvents,
		bool applicationContext,
		bool sessionContext,
		int sessionCheckInterval,
		int foregroundTimeout,
		int backgroundTimeout,
		bool lifecycleEvents,
		bool screenContext,
		bool installTracking,
	}) :
			base64 = base64 ?? false,
			devicePlatform = devicePlatform ?? DevicePlatforms.Mobile,
			logLevel = logLevel ?? LogLevel.OFF,
			mobileContext = mobileContext ?? false,
			screenViewEvents = screenViewEvents ?? false,
			applicationContext = applicationContext ?? false,
			sessionContext = sessionContext ?? false,
			sessionCheckInterval = sessionCheckInterval ?? 15,
			foregroundTimeout = foregroundTimeout ?? 600,
			backgroundTimeout = backgroundTimeout ?? 300,
			lifecycleEvents = lifecycleEvents ?? false,
			screenContext = screenContext ?? false,
			installTracking = installTracking ?? false;

	Tracker._builder(TrackerBuilder builder) :
			emitter = builder._emitter,
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
			installTracking = builder._installTracking;

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
		};
	}
}

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
	}

	TrackerBuilder setBase64(bool base64) {
		_base64 = base64;
		return this;
	}

	TrackerBuilder setDevicePlatform(DevicePlatforms devicePlatform) {
		_devicePlatform = devicePlatform;
		return this;
	}

	TrackerBuilder setLogLevel(LogLevel logLevel) {
		_logLevel = logLevel;
		return this;
	}

	TrackerBuilder setMobileContext(bool mobileContext) {
		_mobileContext = mobileContext;
		return this;
	}

	TrackerBuilder setScreenViewEvents(bool screenViewEvents) {
		_screenViewEvents = screenViewEvents;
		return this;
	}

	TrackerBuilder setApplicationContext(bool applicationContext) {
		_applicationContext = applicationContext;
		return this;
	}

	TrackerBuilder setSessionContext(bool sessionContext) {
		_sessionContext = sessionContext;
		return this;
	}

	TrackerBuilder setSessionCheckInterval(int sessionCheckInterval) {
		_sessionCheckInterval = sessionCheckInterval;
		return this;
	}

	TrackerBuilder setForegroundTimeout(int foregroundTimeout) {
		_foregroundTimeout = foregroundTimeout;
		return this;
	}

	TrackerBuilder setBackgroundTimeout(int backgroundTimeout) {
		_backgroundTimeout = backgroundTimeout;
		return this;
	}

	TrackerBuilder setLifecycleEvents(bool lifecycleEvents) {
		_lifecycleEvents = lifecycleEvents;
		return this;
	}

	TrackerBuilder setScreenContext(bool screenContext) {
		_screenContext = screenContext;
		return this;
	}

	TrackerBuilder setInstallTracking(bool installTracking) {
		_installTracking = installTracking;
		return this;
	}

	Tracker build() {
		return Tracker._builder(this);
	}
}