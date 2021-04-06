import 'package:flutter/foundation.dart';
import 'abstract_event.dart';

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

  /// Creates a [Timing] event
  Timing({
    required this.category,
    required this.variable,
    required this.timing,
    this.label,
  })  : assert(category.isNotEmpty, 'category cannot be empty'),
        assert(variable.isNotEmpty, 'category cannot be empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'category': category,
      'variable': variable,
      'timing': timing,
      'label': label,
    };
  }
}
