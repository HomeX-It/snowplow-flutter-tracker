import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class SelfDescribingJson extends AbstractEvent {
	final String schema;
	final Map<String, dynamic> payload;

	const SelfDescribingJson({@required this.schema, @required this.payload});

	SelfDescribingJson._builder(SelfDescribingJsonBuilder builder) :
			schema = builder._schema,
			payload = builder._payload;

	@override
	Map<String, Object> toMap() {
		return {
			'schema': schema,
			'payload': payload,
		};
	}
}

class SelfDescribingJsonBuilder {
	String _schema;
	Map<String, dynamic> _payload;

	SelfDescribingJsonBuilder setSchema(String schema) {
		_schema = schema;
		return this;
	}

	SelfDescribingJsonBuilder setPayload(Map<String, dynamic> payload) {
		_payload = payload;
		return this;
	}

	SelfDescribingJson build() {
		return SelfDescribingJson._builder(this);
	}
}