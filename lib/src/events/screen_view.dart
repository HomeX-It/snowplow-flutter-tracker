import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [ScreenView] event\
@immutable
class ScreenView implements AbstractEvent {
  /// [name] The name of the screen.
  final String name;

  /// [type] The type for the screen.
  final String? type;

  /// [transitionType] The type of the screen transition.
  final String? transitionType;

  /// [previousName] The name of the previous screen.
  final String? previousName;

  /// [previousType] The type of the previous screen.
  final String? previousType;

  @override
  final Set<SelfDescribingJson> contexts;

  /// Creates a [ScreenView] event
  ScreenView({
    required this.name,
    this.type,
    this.transitionType,
    this.previousName,
    this.previousType,
    this.contexts = const {},
  }) : assert(name.isNotEmpty, 'name cannot be null or empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'type': type,
      'transitionType': transitionType,
      'previousName': previousName,
      'previousType': previousType,
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScreenView &&
          name == other.name &&
          type == other.type &&
          transitionType == other.transitionType &&
          previousName == other.previousName &&
          previousType == other.previousType &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      transitionType.hashCode ^
      previousName.hashCode ^
      previousType.hashCode ^
      contexts.hashCode;

  @override
  ScreenView attach({
    required Set<SelfDescribingJson> contexts,
  }) =>
      ScreenView(
        name: name,
        type: type,
        transitionType: transitionType,
        previousName: previousName,
        previousType: previousType,
        contexts: this.contexts.union(contexts),
      );
}
