import 'package:flutter/foundation.dart';

/// [SelfDescribingJson] event.
@immutable
class SelfDescribingJson {
  /// [schema] The schema URI for this self-describing JSON.
  final String? schema;

  /// [payload] Data of the self-describing JSON.
  final Map<String, dynamic>? payload;

  /// Creates a [SelfDescribingJson] event.
  const SelfDescribingJson({this.schema, this.payload});

  /// Converts the self-describing JSON object to JSON.
  Map<String, Object?> toMap() {
    return {
      'schema': schema,
      'payload': payload,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SelfDescribingJson &&
          schema == other.schema &&
          payload == other.payload;

  @override
  int get hashCode => schema.hashCode ^ payload.hashCode;
}
