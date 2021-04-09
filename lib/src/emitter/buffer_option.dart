import 'package:flutter/foundation.dart';

/// [BufferOption] Defines how many events we bundle in a POST.
@immutable
class BufferOption {
  /// Raw string value
  final String name;

  const BufferOption._(this.name);

  /// Single
  static const single = BufferOption._('Single');

  /// DefaultGroup
  static const defaultGroup = BufferOption._('DefaultGroup');

  /// HeavyGroup
  static const heavyGroup = BufferOption._('HeavyGroup');

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BufferOption && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
