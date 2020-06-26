import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'log_level.g.dart';

class LogLevel extends EnumClass {
	static Serializer<LogLevel> get serializer => _$logLevelSerializer;

	@BuiltValueEnumConst(wireNumber: 0)
	static const LogLevel OFF = _$off;

	@BuiltValueEnumConst(wireNumber: 1)
	static const LogLevel ERROR = _$error;

	@BuiltValueEnumConst(wireNumber: 2)
	static const LogLevel DEBUG = _$debug;

	@BuiltValueEnumConst(wireNumber: 3)
	static const LogLevel VERBOSE = _$verbose;

	const LogLevel._(String name) : super(name);

	static BuiltSet<LogLevel> get values => _$values;
	static LogLevel valueOf(String name) => _$valueOf(name);
}