import 'package:flutter/foundation.dart';
import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [SelfDescribing] event
@immutable
class SelfDescribing implements AbstractEvent {
  /// [eventData] A self-describing JSON of a self describing event.
  final SelfDescribingJson eventData;

  /// Creates a [SelfDescribing] event
  SelfDescribing(this.eventData);

  @override
  Map<String, Object?> toMap() {
    return {
      'eventData': eventData.toMap(),
    };
  }
}
