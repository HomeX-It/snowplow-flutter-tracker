import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/emitter/buffer_option.dart';
import 'package:snowplow_flutter_tracker/model/emitter/http_method.dart';
import 'package:snowplow_flutter_tracker/model/emitter/request_security.dart';

class Emitter {
	final String uri;
	final HttpMethod httpMethod;
	final BufferOption bufferOption;
	final RequestSecurity requestSecurity;

	const Emitter({@required this.uri, HttpMethod httpMethod, BufferOption bufferOption, RequestSecurity requestSecurity}) :
			httpMethod = httpMethod ?? HttpMethod.POST,
			bufferOption = bufferOption ?? BufferOption.DefaultGroup,
			requestSecurity = requestSecurity ?? RequestSecurity.HTTP;

	Emitter._builder(EmitterBuilder builder) :
			uri = builder._uri,
			httpMethod = builder._httpMethod,
			bufferOption = builder._bufferOption,
			requestSecurity = builder._requestSecurity;

	Map<String, Object> toMap() {
		return {
			'uri': uri,
			'httpMethod': httpMethod.name,
			'bufferOption': bufferOption.name,
			'requestSecurity': requestSecurity.name,
		};
	}
}

class EmitterBuilder {
	String _uri;
	HttpMethod _httpMethod;
	BufferOption _bufferOption;
	RequestSecurity _requestSecurity;

	EmitterBuilder(String uri) {
		_uri = uri;
		_httpMethod = HttpMethod.POST;
		_bufferOption = BufferOption.DefaultGroup;
		_requestSecurity = RequestSecurity.HTTP;
	}

	EmitterBuilder setHttpMethod(HttpMethod httpMethod) {
		_httpMethod = httpMethod;
		return this;
	}

	EmitterBuilder setBufferOption(BufferOption bufferOption) {
		_bufferOption = bufferOption;
		return this;
	}

	EmitterBuilder setRequestSecurity(RequestSecurity requestSecurity) {
		_requestSecurity = requestSecurity;
		return this;
	}

	Emitter build() {
		return Emitter._builder(this);
	}
}