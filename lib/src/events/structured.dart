import 'package:flutter/foundation.dart';
import 'abstract_event.dart';

/// [Structured] event
@immutable
class Structured implements AbstractEvent {
  /// [category] The category of the structured event
  final String category;

  /// [action] The action of the structured event
  final String action;

  /// [label] The label of the structured event
  final String label;

  /// [property] The property of the structured event
  final String property;

  /// [value] The value of the structured event
  final double value;

  /// Creates a [Structured] event
  Structured({
    @required this.category,
    @required this.action,
    this.label,
    this.property,
    @required this.value,
  })  : assert(category != null && category.isNotEmpty,
            'category cannot be null or empty'),
        assert(action != null && action.isNotEmpty,
            'action cannot be null or empty'),
        assert(value != null, 'value cannot be null');
  @override
  Map<String, Object> toMap() {
    return {
      'category': category,
      'action': action,
      'label': label,
      'property': property,
      'value': value,
    };
  }
}
