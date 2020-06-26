import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class Timing extends AbstractEvent {
	final String category;
	final String variable;
	final int timing;
	final String label;

	const Timing({
		@required this.category,
		@required this.variable,
		@required this.timing,
		@required this.label,
	});

	Timing._builder(TimingBuilder builder) :
		category = builder._category,
		variable = builder._variable,
		timing = builder._timing,
		label = builder._label;

	@override
  Map<String, Object> toMap() {
    return {
			'category': category,
			'variable': variable,
			'timing': timing,
			'label': label,
		};
  }
}

class TimingBuilder {
	String _category;
	String _variable;
	int _timing;
	String _label;

	TimingBuilder setCategory(String category) {
		_category = category;
		return this;
	}

	TimingBuilder setVariable(String variable) {
		_variable = variable;
		return this;
	}

	TimingBuilder setTiming(int timing) {
		_timing = timing;
		return this;
	}

	TimingBuilder setLabel(String label) {
		_label = label;
		return this;
	}

	Timing build() {
		return Timing._builder(this);
	}
}