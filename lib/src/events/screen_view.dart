import 'package:flutter/foundation.dart';

import 'abstract_event.dart';

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

  /// Creates a [ScreenView] event
  ScreenView({
    required this.name,
    this.type,
    this.transitionType,
    this.previousName,
    this.previousType,
  }) : assert(name.isNotEmpty, 'name cannot be null or empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'name': name,
      'type': type,
      'transitionType': transitionType,
      'previousName': previousName,
      'previousType': previousType,
    };
  }
}
