// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_method.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const HttpMethod _$get = const HttpMethod._('GET');
const HttpMethod _$post = const HttpMethod._('POST');

HttpMethod _$valueOf(String name) {
  switch (name) {
    case 'GET':
      return _$get;
    case 'POST':
      return _$post;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<HttpMethod> _$values =
    new BuiltSet<HttpMethod>(const <HttpMethod>[
  _$get,
  _$post,
]);

Serializer<HttpMethod> _$httpMethodSerializer = new _$HttpMethodSerializer();

class _$HttpMethodSerializer implements PrimitiveSerializer<HttpMethod> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'GET': 'GET',
    'POST': 'POST',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'GET': 'GET',
    'POST': 'POST',
  };

  @override
  final Iterable<Type> types = const <Type>[HttpMethod];
  @override
  final String wireName = 'HttpMethod';

  @override
  Object serialize(Serializers serializers, HttpMethod object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  HttpMethod deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      HttpMethod.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
