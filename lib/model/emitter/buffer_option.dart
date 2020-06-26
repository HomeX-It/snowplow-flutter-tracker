import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'buffer_option.g.dart';

class BufferOption extends EnumClass {
	static Serializer<BufferOption> get serializer => _$bufferOptionSerializer;

	@BuiltValueEnumConst(wireNumber: 1)
	static const BufferOption Single = _$single;

	@BuiltValueEnumConst(wireNumber: 10)
	static const BufferOption DefaultGroup = _$defaultGroup;

	@BuiltValueEnumConst(wireNumber: 25)
	static const BufferOption HeavyGroup = _$heavyGroup;

	const BufferOption._(String name) : super(name);

	static BuiltSet<BufferOption> get values => _$values;
	static BufferOption valueOf(String name) => _$valueOf(name);
}