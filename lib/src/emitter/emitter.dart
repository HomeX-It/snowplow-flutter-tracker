import 'package:flutter/foundation.dart';

import 'buffer_option.dart';
import 'http_method.dart';
import 'request_security.dart';

/// [Emitter] This class sends events to the collector.
@immutable
class Emitter {
  /// [uri] The collector endpoint.
  final String uri;

  /// [httpMethod] Should be GET or POST
  final HttpMethod httpMethod;

  /// [bufferOption] Number of events sent in a POST.
  final BufferOption bufferOption;

  /// [requestSecurity] Should be HTTP or HTTPS.
  final RequestSecurity requestSecurity;

  /// Create an [Emitter]
  const Emitter({
    required this.uri,
    this.httpMethod = HttpMethod.post,
    this.bufferOption = BufferOption.defaultGroup,
    this.requestSecurity = RequestSecurity.http,
  });

  /// Converts the emitter object to JSON.
  Map<String, Object> toMap() {
    return {
      'uri': uri,
      'httpMethod': httpMethod.name,
      'bufferOption': bufferOption.name,
      'requestSecurity': requestSecurity.name,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Emitter &&
          uri == other.uri &&
          httpMethod == other.httpMethod &&
          bufferOption == other.bufferOption &&
          requestSecurity == other.requestSecurity;

  @override
  int get hashCode =>
      uri.hashCode ^
      httpMethod.hashCode ^
      bufferOption.hashCode ^
      requestSecurity.hashCode;
}
