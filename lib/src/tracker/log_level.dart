import 'package:flutter/foundation.dart';

/// [LogLevel] An enum for logging level types.
@immutable
class LogLevel {
  /// Raw string value
  final String name;

  const LogLevel._(this.name);

  /// Logging turned off
  static const off = LogLevel._('OFF');

  /// Logging turned on, on error events
  static const error = LogLevel._('ERROR');

  /// Logging turned on, on debugging events
  static const debug = LogLevel._('DEBUG');

  /// Logging turned on, on all events
  static const verbose = LogLevel._('VERBOSE');
}
