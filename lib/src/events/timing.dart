import 'package:flutter/foundation.dart';
import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [Timing] event.
@immutable
class Timing implements AbstractEvent {
  /// [category] A logical group name for variables.
  final String category;

  /// [variable] Identify the timing being recorded.
  final String variable;

  /// [timing] The number of milliseconds in elapsed time to report.
  final int timing;

  /// [label] Optional description of this timing.
  final String? label;

  @override
  final Set<SelfDescribingJson> contexts;

  /// Creates a [Timing] event
  Timing({
    required this.category,
    required this.variable,
    required this.timing,
    this.label,
    this.contexts = const {},
  })  : assert(category.isNotEmpty, 'category cannot be empty'),
        assert(variable.isNotEmpty, 'category cannot be empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'category': category,
      'variable': variable,
      'timing': timing,
      'label': label,
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Timing &&
          category == other.category &&
          variable == other.variable &&
          timing == other.timing &&
          label == other.label &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      category.hashCode ^
      variable.hashCode ^
      timing.hashCode ^
      label.hashCode ^
      contexts.hashCode;

  @override
  Timing attach({
    required Set<SelfDescribingJson> contexts,
  }) =>
      Timing(
        category: category,
        variable: variable,
        timing: timing,
        label: label,
        contexts: this.contexts.union(contexts),
      );
}
