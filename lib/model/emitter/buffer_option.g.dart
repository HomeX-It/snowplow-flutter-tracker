// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buffer_option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BufferOption _$single = const BufferOption._('Single');
const BufferOption _$defaultGroup = const BufferOption._('DefaultGroup');
const BufferOption _$heavyGroup = const BufferOption._('HeavyGroup');

BufferOption _$valueOf(String name) {
  switch (name) {
    case 'Single':
      return _$single;
    case 'DefaultGroup':
      return _$defaultGroup;
    case 'HeavyGroup':
      return _$heavyGroup;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BufferOption> _$values =
    new BuiltSet<BufferOption>(const <BufferOption>[
  _$single,
  _$defaultGroup,
  _$heavyGroup,
]);

Serializer<BufferOption> _$bufferOptionSerializer =
    new _$BufferOptionSerializer();

class _$BufferOptionSerializer implements PrimitiveSerializer<BufferOption> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Single': 1,
    'DefaultGroup': 10,
    'HeavyGroup': 25,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'Single',
    10: 'DefaultGroup',
    25: 'HeavyGroup',
  };

  @override
  final Iterable<Type> types = const <Type>[BufferOption];
  @override
  final String wireName = 'BufferOption';

  @override
  Object serialize(Serializers serializers, BufferOption object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  BufferOption deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BufferOption.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
