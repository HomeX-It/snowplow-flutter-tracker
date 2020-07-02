import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

/// [ScreenView] event
class ScreenView implements AbstractEvent {
	/// [name] The name of the screen.
	final String name;
	/// [type] The type for the screen.
	final String type;
	/// [transitionType] The type of the screen transition.
	final String transitionType;
	/// [previousName] The name of the previous screen.
	final String previousName;
	/// [previousType] The type of the previous screen.
	final String previousType;

  ScreenView._builder(ScreenViewBuilder builder) :
			assert(builder._name != null && builder._name.isNotEmpty, 'name cannot be null or empty'),
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

/// The protocol for building screen view events.
class ScreenViewBuilder {
	String _name;
	String _type;
	String _transitionType;
	String _previousName;
	String _previousType;

	/// Set the name of the screen.
	ScreenViewBuilder setName(String name) {
		_name = name;
		return this;
	}

	/// Set the type of the screen.
	ScreenViewBuilder setType(String type) {
		_type = type;
		return this;
	}

	/// Set the type of the screen transition.
	ScreenViewBuilder setTransitionType(String transitionType) {
		_transitionType = transitionType;
		return this;
	}

	/// Set the name of the previous screen.
	ScreenViewBuilder setPreviousName(String previousName) {
		_previousName = previousName;
		return this;
	}

	/// Set the type of the previous screen.
	ScreenViewBuilder setPreviousType(String previousType) {
		_previousType = previousType;
		return this;
	}

	/// A screen view event.
	ScreenView build() {
		return ScreenView._builder(this);
	}
}