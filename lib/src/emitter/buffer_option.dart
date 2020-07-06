import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'buffer_option.g.dart';

/// [BufferOption] Defines how many events we bundle in a POST.
class BufferOption extends EnumClass {
  /// [Single] One event of bundle in a POST.
  @BuiltValueEnumConst(wireNumber: 1)
  static const BufferOption Single = _$single;

  /// [DefaultGroup] 10 events of bundle in a POST.
  @BuiltValueEnumConst(wireNumber: 10)
  static const BufferOption DefaultGroup = _$defaultGroup;

  /// [HeavyGroup] 25 events of bundle in a POST.
  @BuiltValueEnumConst(wireNumber: 25)
  static const BufferOption HeavyGroup = _$heavyGroup;

  const BufferOption._(String name) : super(name);

  /// [values] Returns all values.
  static BuiltSet<BufferOption> get values => _$values;

  /// [valueOf] Makes [BufferOption] from the value.
  static BufferOption valueOf(String name) => _$valueOf(name);
}
