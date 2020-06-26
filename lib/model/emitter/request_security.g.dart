// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_security.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RequestSecurity _$http = const RequestSecurity._('HTTP');
const RequestSecurity _$https = const RequestSecurity._('HTTPS');

RequestSecurity _$valueOf(String name) {
  switch (name) {
    case 'HTTP':
      return _$http;
    case 'HTTPS':
      return _$https;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<RequestSecurity> _$values =
    new BuiltSet<RequestSecurity>(const <RequestSecurity>[
  _$http,
  _$https,
]);

Serializer<RequestSecurity> _$requestSecuritySerializer =
    new _$RequestSecuritySerializer();

class _$RequestSecuritySerializer
    implements PrimitiveSerializer<RequestSecurity> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'HTTP': 'HTTP',
    'HTTPS': 'HTTPS',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'HTTP': 'HTTP',
    'HTTPS': 'HTTPS',
  };

  @override
  final Iterable<Type> types = const <Type>[RequestSecurity];
  @override
  final String wireName = 'RequestSecurity';

  @override
  Object serialize(Serializers serializers, RequestSecurity object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  RequestSecurity deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      RequestSecurity.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
