import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_platforms.g.dart';

class DevicePlatforms extends EnumClass {
	static Serializer<DevicePlatforms> get serializer => _$devicePlatformsSerializer;

	@BuiltValueEnumConst(wireName: 'web')
	static const DevicePlatforms Web = _$web;

	@BuiltValueEnumConst(wireName: 'mob')
	static const DevicePlatforms Mobile = _$mob;

	@BuiltValueEnumConst(wireName: 'pc')
	static const DevicePlatforms Desktop = _$pc;

	@BuiltValueEnumConst(wireName: 'srv')
	static const DevicePlatforms ServerSideApp = _$srv;

	@BuiltValueEnumConst(wireName: 'app')
	static const DevicePlatforms General = _$app;

	@BuiltValueEnumConst(wireName: 'tv')
	static const DevicePlatforms ConnectedTV = _$tv;

	@BuiltValueEnumConst(wireName: 'cnsl')
	static const DevicePlatforms GameConsole = _$cnsl;

	@BuiltValueEnumConst(wireName: 'iot')
	static const DevicePlatforms InternetOfThings = _$iot;

	const DevicePlatforms._(String name) : super(name);

	static BuiltSet<DevicePlatforms> get values => _$values;
	static DevicePlatforms valueOf(String name) => _$valueOf(name);
}