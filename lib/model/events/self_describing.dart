import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';
import 'package:snowplow_flutter_tracker/model/events/self_describing_json.dart';

class SelfDescribing extends AbstractEvent {
	final SelfDescribingJson eventData;

  const SelfDescribing({@required this.eventData});

	SelfDescribing._builder(SelfDescribingBuilder builder) : eventData = builder._eventData;

	@override
  Map<String, Object> toMap() {
		return {
			'eventData': eventData.toMap(),
		};
  }
}

class SelfDescribingBuilder {
	SelfDescribingJson _eventData;

	SelfDescribingBuilder setEventData(SelfDescribingJson eventData) {
		_eventData = eventData;
		return this;
	}

	SelfDescribing build() {
		return SelfDescribing._builder(this);
	}
}