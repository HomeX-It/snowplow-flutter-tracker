import 'package:flutter/foundation.dart';

/// [HttpMethod] An enum for HTTP method types.
@immutable
class HttpMethod {
  /// Raw string value
  final String name;

  const HttpMethod._(this.name);

  /// GET request.
  static const get = HttpMethod._('GET');

  /// POST request.
  static const post = HttpMethod._('POST');

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is HttpMethod && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
