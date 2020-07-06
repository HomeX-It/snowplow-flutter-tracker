/// [SelfDescribingJson] event.
class SelfDescribingJson {
  /// [schema] The schema URI for this self-describing JSON.
  final String schema;

  /// [payload] Data of the self-describing JSON.
  final Map<String, dynamic> payload;

  SelfDescribingJson._builder(SelfDescribingJsonBuilder builder)
      : schema = builder._schema,
        payload = builder._payload;

  /// Converts the self-describing JSON object to JSON.
  Map<String, Object> toMap() {
    return {
      'schema': schema,
      'payload': payload,
    };
  }
}

/// The protocol for building self-describing JSON.
class SelfDescribingJsonBuilder {
  String _schema;
  Map<String, dynamic> _payload;

  /// Set the schema of the self-describing JSON.
  SelfDescribingJsonBuilder setSchema(String schema) {
    _schema = schema;
    return this;
  }

  /// Set the data of the self-describing JSON.
  SelfDescribingJsonBuilder setPayload(Map<String, dynamic> payload) {
    _payload = payload;
    return this;
  }

  /// Creates a self-describing JSON.
  SelfDescribingJson build() {
    return SelfDescribingJson._builder(this);
  }
}
