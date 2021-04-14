import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';
import 'package:snowplow_flutter_tracker/src/tracker/trackers/global_context_tracker.dart';

import 'utils/mock_tracker.dart';

void main() {
  final event = ScreenView(name: 'name', contexts: {});

  test('Attaches a global context to tracked events', () async {
    final mock = MockTracker();

    final context = SelfDescribingJson(
      payload: {},
      schema: 'schema',
    );

    final sut = GlobalContextTracker(mock, () async => context);

    await sut.track(event);

    expect(
      mock.trackedEvents[0],
      equals(
        ScreenView(
          name: 'name',
          contexts: {context},
        ),
      ),
    );
  });
}
