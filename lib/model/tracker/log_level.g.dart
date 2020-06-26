// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_level.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const LogLevel _$off = const LogLevel._('OFF');
const LogLevel _$error = const LogLevel._('ERROR');
const LogLevel _$debug = const LogLevel._('DEBUG');
const LogLevel _$verbose = const LogLevel._('VERBOSE');

LogLevel _$valueOf(String name) {
  switch (name) {
    case 'OFF':
      return _$off;
    case 'ERROR':
      return _$error;
    case 'DEBUG':
      return _$debug;
    case 'VERBOSE':
      return _$verbose;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LogLevel> _$values = new BuiltSet<LogLevel>(const <LogLevel>[
  _$off,
  _$error,
  _$debug,
  _$verbose,
]);

Serializer<LogLevel> _$logLevelSerializer = new _$LogLevelSerializer();

class _$LogLevelSerializer implements PrimitiveSerializer<LogLevel> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'OFF': 0,
    'ERROR': 1,
    'DEBUG': 2,
    'VERBOSE': 3,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    0: 'OFF',
    1: 'ERROR',
    2: 'DEBUG',
    3: 'VERBOSE',
  };

  @override
  final Iterable<Type> types = const <Type>[LogLevel];
  @override
  final String wireName = 'LogLevel';

  @override
  Object serialize(Serializers serializers, LogLevel object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  LogLevel deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LogLevel.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
