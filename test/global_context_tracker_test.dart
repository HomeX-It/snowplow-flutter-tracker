import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';
import 'package:snowplow_flutter_tracker/src/tracker/trackers/global_context_tracker.dart';

import 'utils/mock_tracker.dart';

void main() {
  final event = ScreenView(name: 'name', contexts: {});

  final context = SelfDescribingJson(
    payload: {},
    schema: 'schema',
  );

  final expectedEvent = ScreenView(
    name: 'name',
    contexts: {context},
  );

  test(
      'Attaches global context to all events, if no shouldAttachTo is provided',
      () async {
    final mock = MockTracker();

    final sut = GlobalContextTracker(
      child: mock,
      buildContext: () async => context,
    );

    await sut.track(event);

    expect(
      mock.trackedEvents,
      equals([expectedEvent]),
    );
  });

  test(
      'Attaches global context to tracked events, if truthy shouldAttachTo is provided',
      () async {
    final mock = MockTracker();

    final sut = GlobalContextTracker(
      child: mock,
      shouldAttachTo: (_) => true,
      buildContext: () async => context,
    );

    await sut.track(event);

    expect(
      mock.trackedEvents,
      equals([expectedEvent]),
    );
  });

  test(
      'Does not attach global context to tracked events, if falsy shouldAttachTo is provided',
      () async {
    final mock = MockTracker();

    final context = SelfDescribingJson(
      payload: {},
      schema: 'schema',
    );

    final sut = GlobalContextTracker(
      child: mock,
      shouldAttachTo: (_) => false,
      buildContext: () async => context,
    );

    await sut.track(event);

    expect(
      mock.trackedEvents,
      equals([event]),
    );
  });
}