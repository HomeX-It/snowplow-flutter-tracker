import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

/// [AbstractEvent] Base class of all the events.
abstract class AbstractEvent {
  /// [contexts] Attached custom contexts
  final List<SelfDescribingJson> contexts;

  /// Default initialiser
  AbstractEvent({required this.contexts});

  /// Converts the event object to JSON.
  Map<String, Object?> toMap();

  /// [attach] Attaches additional contexts to the event
  AbstractEvent attach({
    required List<SelfDescribingJson> contexts,
  });
}
