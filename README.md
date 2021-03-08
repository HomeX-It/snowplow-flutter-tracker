# Flutter for Snowplow
Thank you to [Patrik Szabó](https://github.com/patricktailor) for his initial work on this library!

## Overview
A Flutter plugin that provides analysis to your Dart software with the [Snowplow](https://snowplowanalytics.com) event tracker for [Flutter](https://flutter.dev).
<br/>
With this tracker you can collect event data from your Flutter applications, games or frameworks.

## Versions
[Snowplow Android Tracker](https://github.com/snowplow/snowplow-android-tracker) v1.4.0<br/>
[Snowplow iOS Tracker](https://github.com/snowplow/snowplow-objc-tracker) v1.3.0<br/>

## Docs
Basics on Android: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/android-tracker/<br/>
Basics on iOS: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/objective-c-tracker/<br/>
Android SDK: https://github.com/snowplow/snowplow-android-tracker<br/>
iOS SDK: https://github.com/snowplow/snowplow-objc-tracker<br/>

## Getting started

Initialize it then call the relevant tracking method:

```Dart
import 'package:snowplow_flutter_tracker/snowplow_flutter_tracker.dart';

/* Initialize it */
SnowplowFlutterTracker _tracker;

final emitter = EmitterBuilder('test-uri')
    .setRequestSecurity(RequestSecurity.HTTPS)
    .build();

final tracker =
    TrackerBuilder(emitter, 'eventTracker', 'test-appId')
        .setMobileContext(true)
        .build();

_tracker = SnowplowFlutterTracker();
_tracker.initialize(tracker);

/* Usage */
final eventJson = SelfDescribingJsonBuilder()
  .setSchema('iglu:mobile/generic/jsonschema/1-0-0')
  .setPayload(
      <String, Object>{'name': 'test-name', 'parameters': 'test-parameters'}).build();

final selfDescribingEvent =
  SelfDescribingBuilder().setEventData(eventJson).build();

_tracker.track(selfDescribingEvent);
```