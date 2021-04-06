import 'package:flutter/foundation.dart';

/// [DevicePlatforms] An enum for device platform types.
@immutable
class DevicePlatforms {
  /// Raw string value
  final String name;

  const DevicePlatforms._(this.name);

  /// Web application
  static const web = DevicePlatforms._('Web');

  /// Mobile application
  static const mobile = DevicePlatforms._('Mobile');

  /// Desktop application
  static const desktop = DevicePlatforms._('Desktop');

  /// Server side application
  static const serverSideApp = DevicePlatforms._('ServerSideApp');

  /// General application
  static const general = DevicePlatforms._('General');

  /// TV application
  static const connectedTv = DevicePlatforms._('ConnectedTV');

  /// Game console application
  static const gameConsole = DevicePlatforms._('GameConsole');

  /// Internet of things application
  static const internetOfThings = DevicePlatforms._('InternetOfThings');
}
