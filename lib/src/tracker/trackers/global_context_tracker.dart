import 'package:meta/meta.dart';

import '../abstract_tracker.dart';
import '../../events/abstract_event.dart';
import '../../events/self_describing_json.dart';

/// [GlobalContextTracker]
/// Attaches a global context to all events
@immutable
class GlobalContextTracker extends AbstractTracker {
  final AbstractTracker _wrapped;
  final Future<List<SelfDescribingJson>> Function() _buildContext;

  /// Default initialiser
  const GlobalContextTracker(this._wrapped, this._buildContext);

  @override
  Future<void> track(AbstractEvent event) async => _wrapped.track(
        event.attach(
          contexts: await _buildContext(),
        ),
      );
}
