import 'dart:async';

import 'package:flutter/services.dart';

class SnowplowFlutterTracker {
  static const MethodChannel _channel =
      const MethodChannel('snowplow_flutter_tracker');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
