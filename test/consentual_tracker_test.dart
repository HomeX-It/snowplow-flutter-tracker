import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

class MockTracker extends AbstractTracker {
  var initializeInvocationCounter = 0;
  @override
  Future<void> initialize() async {
    initializeInvocationCounter += 1;
  }

  var trackedEvents = <AbstractEvent>[];
  @override
  Future<void> track(AbstractEvent event) async {
    trackedEvents.add(event);
  }

  var destroyInvocationCounter = 0;
  @override
  Future<void> destroy() async {
    destroyInvocationCounter += 1;
  }
}

void main() {
  final event = ScreenView(name: 'name');

  test(
    'If condition is true, ConsentualTracker forwards events',
    () async {
      final mock = MockTracker();

      final valueNotifier = ValueNotifier<bool>(true);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();

      expect(mock.initializeInvocationCounter, equals(1));

      await sut.track(event);

      expect(mock.trackedEvents, equals([event]));
    },
  );

  test(
    'If condition is false, ConsentualTracker does not forward events',
    () async {
      final mock = MockTracker();

      final valueNotifier = ValueNotifier<bool>(false);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();

      expect(mock.initializeInvocationCounter, equals(0));

      await sut.track(event);

      expect(mock.trackedEvents, equals([]));
    },
  );

  test(
    'If condition changes from true to false, underlying tracker is destroyed',
    () async {
      final mock = MockTracker();

      final valueNotifier = ValueNotifier<bool>(true);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();

      expect(mock.initializeInvocationCounter, equals(1));

      valueNotifier.value = false;

      expect(mock.destroyInvocationCounter, equals(1));
    },
  );

  test(
    'If condition changes from false to true, underlying tracker is initialised',
    () async {
      final mock = MockTracker();

      final valueNotifier = ValueNotifier<bool>(false);

      final sut = ConsentualTracker(
        () => mock,
        valueNotifier,
      );

      await sut.initialize();

      expect(mock.initializeInvocationCounter, equals(0));

      valueNotifier.value = true;

      expect(mock.initializeInvocationCounter, equals(1));
    },
  );
}
