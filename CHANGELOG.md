# Changelog
## [0.11.1] Jan 17, 2022
- **Android:** Migrated from jcenter to mavenCentral
- **Android:** Updated Kotlin to 1.6.10
- **Android:** Updated Gradle to 7.0.2
- **Android:** Updated Gradle Build Tools to 7.0.4

## [0.11.0] Apr 6, 2021
- Null safety migration
- Many breaking changes in the API to simplify the codebase and reduce dependencies

## [0.10.0] Mar 8, 2021
- **Android:** Stop logging of Snowplow success/failure message in the Console IF LogLevel is set to OFF

## [0.9.2] Jul 6, 2020
### Added
- **Flutter:** formatting issues fixed by `flutter format`

## [0.9.1] Jul 5, 2020
### Added
- **Flutter:** Example application credentials updated

## [0.9.0] Jul 5, 2020
### Added
- **Flutter:** Tracker initialization, Subject setter and event tracking
- **Android:** Tracker, Emitter and Subject creation
- **Android:** PageView, Structured, Unstructured, ScreenView, ConsentWithdrawn, ConsentGranted, Timing and EcommTransaction event tracking
- **iOS:** PageView, Structured, Unstructured, ScreenView, ConsentWithdrawn, ConsentGranted, Timing, EcommTransaction and PushNotification event tracking