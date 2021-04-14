import 'package:flutter/foundation.dart';
import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [SelfDescribing] event
@immutable
class SelfDescribing implements AbstractEvent {
  /// [eventData] A self-describing JSON of a self describing event.
  final SelfDescribingJson eventData;

  @override
  final List<SelfDescribingJson> contexts;

  /// Creates a [SelfDescribing] event
  const SelfDescribing(this.eventData, {this.contexts = const []});

  @override
  Map<String, Object?> toMap() {
    return {
      'eventData': eventData.toMap(),
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelfDescribing &&
          eventData == other.eventData &&
          contexts == other.contexts;

  @override
  int get hashCode => eventData.hashCode ^ contexts.hashCode;

  @override
  SelfDescribing attach({
    required List<SelfDescribingJson> contexts,
  }) =>
      SelfDescribing(
        eventData,
        contexts: this.contexts + contexts,
      );
}
