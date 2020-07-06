import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'log_level.g.dart';

/// [LogLevel] An enum for logging level types.
class LogLevel extends EnumClass {
  /// [OFF] Logging turned off.
  @BuiltValueEnumConst(wireNumber: 0)
  static const LogLevel OFF = _$off;

  /// [ERROR] Logging turned on, on error events.
  @BuiltValueEnumConst(wireNumber: 1)
  static const LogLevel ERROR = _$error;

  /// [DEBUG] Logging turned on, on debugging events.
  @BuiltValueEnumConst(wireNumber: 2)
  static const LogLevel DEBUG = _$debug;

  /// [VERBOSE] Logging turned on, on all events.
  @BuiltValueEnumConst(wireNumber: 3)
  static const LogLevel VERBOSE = _$verbose;

  const LogLevel._(String name) : super(name);

  /// [values] Returns all values.
  static BuiltSet<LogLevel> get values => _$values;

  /// [valueOf] Makes [LogLevel] from the value.
  static LogLevel valueOf(String name) => _$valueOf(name);
}
