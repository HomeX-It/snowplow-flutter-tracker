import '../events/abstract_event.dart';
import 'gdpr_context.dart';
import 'subject.dart';

/// [AbstractTracker]
/// An abstract tracker allows to track events
abstract class AbstractTracker {
  /// default init
  const AbstractTracker();

  /// [initialize]
  /// Initializes the tracker.
  Future<void> initialize();

  /// [setSubject]
  /// Sets the subject on the platform's tracker instance.
  Future<void> setSubject(Subject subject);

  /// [enableGdprContext]
  /// Enables GDPR context to be sent with every event.
  Future<void> enableGdprContext(GDPRContext context);

  /// [disableGdprContext]
  /// Disables GDPR context.
  Future<void> disableGdprContext();

  /// [track]
  /// Tracks the given [event] parameter by the platform's tracker instance.
  Future<void> track(AbstractEvent event);

  /// [close]
  /// Deallocates the underlying tracker instance and stops all tracking.
  Future<void> close();
}
