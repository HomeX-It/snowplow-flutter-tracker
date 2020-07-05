import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [SelfDescribing] event
class SelfDescribing implements AbstractEvent {
	/// [eventData] A self-describing JSON of a self describing event.
	final SelfDescribingJson eventData;

	SelfDescribing._builder(SelfDescribingBuilder builder) : eventData = builder._eventData;

	@override
  Map<String, Object> toMap() {
		return {
			'eventData': eventData.toMap(),
		};
  }
}

/// [SelfDescribingBuilder] The protocol for building self describing events.
class SelfDescribingBuilder {
	SelfDescribingJson _eventData;

	/// Set the data field of the self describing event.
	SelfDescribingBuilder setEventData(SelfDescribingJson eventData) {
		_eventData = eventData;
		return this;
	}

	/// A self describing.
	SelfDescribing build() {
		return SelfDescribing._builder(this);
	}
}