import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class Structured extends AbstractEvent {
	final String category;
	final String action;
	final String label;
	final String property;
	final double value;

	const Structured({
		@required this.category,
		@required this.action,
		@required this.label,
		@required this.property,
		@required this.value,
	});

	Structured._builder(StructuredBuilder builder) :
		category = builder._category,
		action = builder._action,
		label = builder._label,
		property = builder._property,
		value = builder._value;

	@override
  Map<String, Object> toMap() {
		return {
			'category': category,
			'action': action,
			'label': label,
			'property': property,
			'value': value,
		};
	}
}

class StructuredBuilder {
	String _category;
	String _action;
	String _label;
	String _property;
	double _value;

	StructuredBuilder setCategory(String category) {
		_category = category;
		return this;
	}

	StructuredBuilder setAction(String action) {
		_action = action;
		return this;
	}

	StructuredBuilder setLabel(String label) {
		_label = label;
		return this;
	}

	StructuredBuilder setProperty(String property) {
		_property = property;
		return this;
	}

	StructuredBuilder setValue(double value) {
		_value = value;
		return this;
	}

	Structured build() {
		return Structured._builder(this);
	}
}