# Snowplow Flutter Tracker
[![pub package](https://img.shields.io/pub/v/snowplow_flutter_tracker.svg?label=snowplow_flutter_tracker&color=blue)](https://pub.dev/packages/snowplow_flutter_tracker)

Thank you to [Patrik Szabó](https://github.com/patricktailor) for his initial work on this library!

## Overview
A [Flutter](https://flutter.dev) plugin that adds analytics to your apps using [Snowplow](https://snowplowanalytics.com).

With this tracker you can collect event data from your Flutter applications, games or frameworks.

## Getting started

Initialize it then call the relevant tracking method:

```dart
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
## Testing Locally
Typlically running a Snowplow server requires deployment on AWS or Google Cloud.

[Snowplow Mini](https://github.com/snowplow/snowplow-mini) is designed to be a simplier version that is easier to deploy or run locally, however it can still be a headache to get it to run locally.

Included in this repository is [Snowplow Dummy Server](https://github.com/HomeXLabs/snowplow-flutter-tracker/tree/main/snowplow_dummy_server) to help solve this problem. This server will simply print requests to the console so you can view the data and ensure your app is configured correctly.

Go to the server directory  
`cd snowplow_dummy_server`

Start the server, which will run on `127.0.0.1:8080`  
`dart bin/main.dart`

The example app in this repository hits `127.0.0.1:8080` by default. This works well when using the iOS Simulator. When using a physical device or the Android Emulator, you will need to use a proxy.

## Native SDK Versions
[Snowplow Android Tracker](https://github.com/snowplow/snowplow-android-tracker) v1.7.1

[Snowplow iOS Tracker](https://github.com/snowplow/snowplow-objc-tracker) v1.6.2

## Offical Snowplow Documentation
Basics on Android: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/android-tracker/

Basics on iOS: https://docs.snowplowanalytics.com/docs/collecting-data/collecting-from-own-applications/objective-c-tracker/

Android SDK: https://github.com/snowplow/snowplow-android-tracker

iOS SDK: https://github.com/snowplow/snowplow-objc-tracker