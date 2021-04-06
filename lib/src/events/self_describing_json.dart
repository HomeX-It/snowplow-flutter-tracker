import 'package:flutter/foundation.dart';

/// [SelfDescribingJson] event.
@immutable
class SelfDescribingJson {
  /// [schema] The schema URI for this self-describing JSON.
  final String? schema;

  /// [payload] Data of the self-describing JSON.
  final Map<String, dynamic>? payload;

  /// Creates a [SelfDescribingJson] event.
  SelfDescribingJson({this.schema, this.payload});

  /// Converts the self-describing JSON object to JSON.
  Map<String, Object?> toMap() {
    return {
      'schema': schema,
      'payload': payload,
    };
  }
}
