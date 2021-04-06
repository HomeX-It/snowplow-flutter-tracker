import 'package:flutter/foundation.dart';

/// [RequestSecurity] An enum for HTTP security.
@immutable
class RequestSecurity {
  /// Raw string value
  final String name;

  const RequestSecurity._(this.name);

  /// HTTP request.
  static const http = RequestSecurity._('HTTP');

  /// HTTPS request.
  static const https = RequestSecurity._('HTTPS');
}
