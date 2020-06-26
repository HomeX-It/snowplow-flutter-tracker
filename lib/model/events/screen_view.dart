import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class ScreenView extends AbstractEvent {
	final String name;
	final String type;
	final String transitionType;
	final String previousName;
	final String previousType;

  const ScreenView({
		@required this.name,
		@required this.type,
		@required this.transitionType,
		@required this.previousName,
		@required this.previousType,
	});

  ScreenView._builder(ScreenViewBuilder builder) :
			name = builder._name,
			type = builder._type,
			transitionType = builder._transitionType,
			previousName = builder._previousName,
			previousType = builder._previousType;

  @override
  Map<String, Object> toMap() {
  	return {
			'name': name,
			'type': type,
			'transitionType': transitionType,
			'previousName': previousName,
			'previousType': previousType,
		};
	}
}

class ScreenViewBuilder {
	String _name;
	String _type;
	String _transitionType;
	String _previousName;
	String _previousType;

	ScreenViewBuilder setName(String name) {
		_name = name;
		return this;
	}

	ScreenViewBuilder setType(String type) {
		_type = type;
		return this;
	}

	ScreenViewBuilder setTransitionType(String transitionType) {
		_transitionType = transitionType;
		return this;
	}

	ScreenViewBuilder setPreviousName(String previousName) {
		_previousName = previousName;
		return this;
	}

	ScreenViewBuilder setPreviousType(String previousType) {
		_previousType = previousType;
		return this;
	}

	ScreenView build() {
		return ScreenView._builder(this);
	}
}