import 'package:flutter/foundation.dart';
import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [SelfDescribing] event
@immutable
class SelfDescribing implements AbstractEvent {
  /// [eventData] A self-describing JSON of a self describing event.
  final SelfDescribingJson eventData;

  /// Creates a [SelfDescribing] event
  const SelfDescribing(this.eventData);

  @override
  Map<String, Object?> toMap() {
    return {
      'eventData': eventData.toMap(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelfDescribing && eventData == other.eventData;

  @override
  int get hashCode => eventData.hashCode;
}
