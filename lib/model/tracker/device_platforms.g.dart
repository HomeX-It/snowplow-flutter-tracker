// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_platforms.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const DevicePlatforms _$web = const DevicePlatforms._('Web');
const DevicePlatforms _$mob = const DevicePlatforms._('Mobile');
const DevicePlatforms _$pc = const DevicePlatforms._('Desktop');
const DevicePlatforms _$srv = const DevicePlatforms._('ServerSideApp');
const DevicePlatforms _$app = const DevicePlatforms._('General');
const DevicePlatforms _$tv = const DevicePlatforms._('ConnectedTV');
const DevicePlatforms _$cnsl = const DevicePlatforms._('GameConsole');
const DevicePlatforms _$iot = const DevicePlatforms._('InternetOfThings');

DevicePlatforms _$valueOf(String name) {
  switch (name) {
    case 'Web':
      return _$web;
    case 'Mobile':
      return _$mob;
    case 'Desktop':
      return _$pc;
    case 'ServerSideApp':
      return _$srv;
    case 'General':
      return _$app;
    case 'ConnectedTV':
      return _$tv;
    case 'GameConsole':
      return _$cnsl;
    case 'InternetOfThings':
      return _$iot;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<DevicePlatforms> _$values =
    new BuiltSet<DevicePlatforms>(const <DevicePlatforms>[
  _$web,
  _$mob,
  _$pc,
  _$srv,
  _$app,
  _$tv,
  _$cnsl,
  _$iot,
]);

Serializer<DevicePlatforms> _$devicePlatformsSerializer =
    new _$DevicePlatformsSerializer();

class _$DevicePlatformsSerializer
    implements PrimitiveSerializer<DevicePlatforms> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'Web': 'web',
    'Mobile': 'mob',
    'Desktop': 'pc',
    'ServerSideApp': 'srv',
    'General': 'app',
    'ConnectedTV': 'tv',
    'GameConsole': 'cnsl',
    'InternetOfThings': 'iot',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'web': 'Web',
    'mob': 'Mobile',
    'pc': 'Desktop',
    'srv': 'ServerSideApp',
    'app': 'General',
    'tv': 'ConnectedTV',
    'cnsl': 'GameConsole',
    'iot': 'InternetOfThings',
  };

  @override
  final Iterable<Type> types = const <Type>[DevicePlatforms];
  @override
  final String wireName = 'DevicePlatforms';

  @override
  Object serialize(Serializers serializers, DevicePlatforms object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  DevicePlatforms deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      DevicePlatforms.valueOf(_fromWire[serialized] ?? serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
