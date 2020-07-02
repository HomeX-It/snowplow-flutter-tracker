import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

/// [Timing] event.
class Timing implements AbstractEvent {
	/// [category] A logical group name for variables.
	final String category;
	/// [variable] Identify the timing being recorded.
	final String variable;
	/// [timing] The number of milliseconds in elapsed time to report.
	final int timing;
	/// [label] Optional description of this timing.
	final String label;

	Timing._builder(TimingBuilder builder) :
		assert(builder._category != null && builder._category.isNotEmpty, 'category cannot be null or empty'),
		assert(builder._variable != null && builder._variable.isNotEmpty, 'category cannot be null or empty'),
		assert(builder._timing != null, 'category cannot be null or empty'),
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

/// The protocol for building timing events.
class TimingBuilder {
	String _category;
	String _variable;
	int _timing;
	String _label;

	/// Set the category of the timing event.
	TimingBuilder setCategory(String category) {
		_category = category;
		return this;
	}

	/// Set the variable of the timing event.
	TimingBuilder setVariable(String variable) {
		_variable = variable;
		return this;
	}

	/// Set the timing.
	TimingBuilder setTiming(int timing) {
		_timing = timing;
		return this;
	}

	/// Set the label.
	TimingBuilder setLabel(String label) {
		_label = label;
		return this;
	}

	/// Creates a timing event.
	Timing build() {
		return Timing._builder(this);
	}
}