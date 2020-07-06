import 'buffer_option.dart';
import 'http_method.dart';
import 'request_security.dart';

/// [Emitter] This class sends events to the collector.
class Emitter {
  /// [uri] The collector endpoint.
  final String uri;

  /// [httpMethod] Should be GET or POST
  final HttpMethod httpMethod;

  /// [bufferOption] Number of events sent in a POST.
  final BufferOption bufferOption;

  /// [requestSecurity] Should be HTTP or HTTPS.
  final RequestSecurity requestSecurity;

  Emitter._builder(EmitterBuilder builder)
      : uri = builder._uri,
        httpMethod = builder._httpMethod,
        bufferOption = builder._bufferOption,
        requestSecurity = builder._requestSecurity;

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

/// The protocol for building emitter.
class EmitterBuilder {
  String _uri;
  HttpMethod _httpMethod;
  BufferOption _bufferOption;
  RequestSecurity _requestSecurity;

  /// [EmitterBuilder] Constructs an EmitterBuilder with required uri value.
  EmitterBuilder(String uri) {
    _uri = uri;
    _httpMethod = HttpMethod.POST;
    _bufferOption = BufferOption.DefaultGroup;
    _requestSecurity = RequestSecurity.HTTP;
  }

  /// Emitter builder method to set HTTP method.
  EmitterBuilder setHttpMethod(HttpMethod httpMethod) {
    _httpMethod = httpMethod;
    return this;
  }

  /// Emitter builder method to set buffer option.
  EmitterBuilder setBufferOption(BufferOption bufferOption) {
    _bufferOption = bufferOption;
    return this;
  }

  /// Emitter builder method to set HTTP security.
  EmitterBuilder setRequestSecurity(RequestSecurity requestSecurity) {
    _requestSecurity = requestSecurity;
    return this;
  }

  /// Creates a emitter.
  Emitter build() {
    return Emitter._builder(this);
  }
}
