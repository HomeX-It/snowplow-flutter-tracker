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
  Emitter({
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
}
