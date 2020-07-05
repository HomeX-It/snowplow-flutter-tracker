import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'device_platforms.g.dart';

/// [DevicePlatforms] An enum for device platform types.
class DevicePlatforms extends EnumClass {
	/// [Web] Browser application.
	@BuiltValueEnumConst(wireName: 'web')
	static const DevicePlatforms Web = _$web;

	/// [Mobile] Mobile application.
	@BuiltValueEnumConst(wireName: 'mob')
	static const DevicePlatforms Mobile = _$mob;

	/// [Desktop] Desktop application.
	@BuiltValueEnumConst(wireName: 'pc')
	static const DevicePlatforms Desktop = _$pc;

	/// [ServerSideApp] Server side application.
	@BuiltValueEnumConst(wireName: 'srv')
	static const DevicePlatforms ServerSideApp = _$srv;

	/// [General] General application.
	@BuiltValueEnumConst(wireName: 'app')
	static const DevicePlatforms General = _$app;

	/// [ConnectedTV] TV application.
	@BuiltValueEnumConst(wireName: 'tv')
	static const DevicePlatforms ConnectedTV = _$tv;

	/// [GameConsole] Game console application.
	@BuiltValueEnumConst(wireName: 'cnsl')
	static const DevicePlatforms GameConsole = _$cnsl;

	/// [InternetOfThings] Internet of things application.
	@BuiltValueEnumConst(wireName: 'iot')
	static const DevicePlatforms InternetOfThings = _$iot;

	const DevicePlatforms._(String name) : super(name);

	/// [values] Returns all values.
	static BuiltSet<DevicePlatforms> get values => _$values;

	/// [valueOf] Makes [DevicePlatforms] from the value.
	static DevicePlatforms valueOf(String name) => _$valueOf(name);
}