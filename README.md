# Flutter for Snowplow
Thank you to [Patrik Szabó](https://github.com/patricktailor) for his initial work on this library!

## Overview
A Flutter plugin that provides analysis to your Dart software with the [Snowplow](https://snowplowanalytics.com) event tracker for [Flutter](https://flutter.dev).


With this tracker you can collect event data from your Flutter applications, games or frameworks.

## Versions
[Snowplow Android Tracker](https://github.com/snowplow/snowplow-android-tracker) v1.7.1


[Snowplow iOS Tracker](https://github.com/snowplow/snowplow-objc-tracker) v1.6.2



## Docs
Basics on Android: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/android-tracker/


Basics on iOS: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/objective-c-tracker/


Android SDK: https://github.com/snowplow/snowplow-android-tracker


iOS SDK: https://github.com/snowplow/snowplow-objc-tracker


## Getting started

Initialize it then call the relevant tracking method:

```Dart
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

// Initialize it
final emitter = Emitter(uri: 'your-collector-endpoint-url');
final tracker = Tracker(
    emitter: emitter,
    namespace: 'your-namespace',
    appId: 'your-appId',
);
var _tracker = SnowplowFlutterTracker();
_tracker.initialize(tracker);

// Usage
final selfDescribingJson = SelfDescribingJson(
    schema: 'iglu:com.acme/event/jsonschema/1-0-0',
    payload: <String, Object>{'message': 'hello world'},
);
final selfDescribing = SelfDescribing(selfDescribingJson);
_tracker.track(selfDescribing);
```