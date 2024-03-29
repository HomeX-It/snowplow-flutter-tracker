import 'package:flutter/foundation.dart';
import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [Structured] event
@immutable
class Structured implements AbstractEvent {
  /// [category] The category of the structured event
  final String category;

  /// [action] The action of the structured event
  final String action;

  /// [label] The label of the structured event
  final String? label;

  /// [property] The property of the structured event
  final String? property;

  /// [value] The value of the structured event
  final double? value;

  @override
  final Set<SelfDescribingJson> contexts;

  /// Creates a [Structured] event
  Structured({
    required this.category,
    required this.action,
    this.label,
    this.property,
    this.value,
    this.contexts = const {},
  })  : assert(category.isNotEmpty, 'category cannot be empty'),
        assert(action.isNotEmpty, 'action cannot be empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'category': category,
      'action': action,
      'label': label,
      'property': property,
      'value': value,
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Structured &&
          category == other.category &&
          action == other.action &&
          label == other.label &&
          property == other.property &&
          value == other.value &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      category.hashCode ^
      action.hashCode ^
      label.hashCode ^
      property.hashCode ^
      value.hashCode ^
      contexts.hashCode;

  @override
  Structured attach({
    required Set<SelfDescribingJson> contexts,
  }) =>
      Structured(
        category: category,
        action: action,
        label: label,
        property: property,
        value: value,
        contexts: this.contexts.union(contexts),
      );
}
