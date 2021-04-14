import 'package:meta/meta.dart';

import '../abstract_tracker.dart';
import '../../events/abstract_event.dart';
import '../../events/self_describing_json.dart';

/// [GlobalContextProvider]
/// Attaches global context to all tracked events
@immutable
class GlobalContextProvider extends AbstractTracker {
  static bool _attachToAllEvents(AbstractEvent _) => true;

  final AbstractTracker _child;
  final bool Function(AbstractEvent) _shouldAttachTo;
  final Future<SelfDescribingJson> Function() _buildContext;

  /// Default initialiser
  const GlobalContextProvider({
    required child,
    shouldAttachTo = _attachToAllEvents,
    required buildContext,
  })   : _child = child,
        _shouldAttachTo = shouldAttachTo,
        _buildContext = buildContext;

  @override
  Future<void> initialize() => _child.initialize();

  @override
  Future<void> track(AbstractEvent event) async => _child.track(
        _shouldAttachTo(event)
            ? event.attach(
                contexts: {await _buildContext()},
              )
            : event,
      );

  @override
  Future<void> close() => _child.close();
}
