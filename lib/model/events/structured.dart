import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

/// [Structured] event
class Structured implements AbstractEvent {
	/// [category] The category of the structured event
	final String category;
	/// [action] The action of the structured event
	final String action;
	/// [label] The label of the structured event
	final String label;
	/// [property] The property of the structured event
	final String property;
	/// [value] The value of the structured event
	final double value;

	Structured._builder(StructuredBuilder builder) :
		assert(builder._category != null && builder._category.isNotEmpty, 'category cannot be null or empty'),
		assert(builder._action != null && builder._action.isNotEmpty, 'action cannot be null or empty'),
		assert(builder._value != null, 'value cannot be null'),
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

/// [StructuredBuilder] The protocol for building structured events.
class StructuredBuilder {
	String _category;
	String _action;
	String _label;
	String _property;
	double _value;

	/// Set the category of the structured event.
	StructuredBuilder setCategory(String category) {
		_category = category;
		return this;
	}

	/// Set the action of the structured event.
	StructuredBuilder setAction(String action) {
		_action = action;
		return this;
	}

	/// Set the label of the structured event.
	StructuredBuilder setLabel(String label) {
		_label = label;
		return this;
	}

	/// Set the property of the structured event.
	StructuredBuilder setProperty(String property) {
		_property = property;
		return this;
	}

	/// Set the value of the structured event.
	StructuredBuilder setValue(double value) {
		_value = value;
		return this;
	}

	/// A structured event.
	Structured build() {
		return Structured._builder(this);
	}
}