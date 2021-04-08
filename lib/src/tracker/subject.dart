import 'package:flutter/foundation.dart';

/// [Subject] This class is used to access and persist user information, it represents the current user being tracked.
@immutable
class Subject {
  /// [userId] The user's ID.
  final String? userId;

  /// [viewportWidth] The viewport width in pixels.
  final int? viewportWidth;

  /// [viewportHeight] The viewport height in pixels.
  final int? viewportHeight;

  /// [screenResolutionWidth] The screen resolution width in pixels.
  final int? screenResolutionWidth;

  /// [screenResolutionHeight] The screen resolution height in pixels.
  final int? screenResolutionHeight;

  /// [colorDepth] The user's color depth.
  final int? colorDepth;

  /// [timezone] The user's timezone.
  final String? timezone;

  /// [language] The user's language.
  final String? language;

  /// [ipAddress] The user's IP address.
  final String? ipAddress;

  /// [userAgent] The user agent (also known as browser string).
  final String? userAgent;

  /// [networkUserId] The network UID.
  final String? networkUserId;

  /// [domainUserId] The domain UID.
  final String? domainUserId;

  /// Creates a [Subject]
  const Subject({
    this.userId,
    this.viewportWidth,
    this.viewportHeight,
    this.screenResolutionWidth,
    this.screenResolutionHeight,
    this.colorDepth,
    this.timezone,
    this.language,
    this.ipAddress,
    this.userAgent,
    this.networkUserId,
    this.domainUserId,
  });

  /// [toMap] Converts the subject object to JSON.
  Map<String, Object?> toMap() {
    return {
      'userId': userId,
      'viewportWidth': viewportWidth,
      'viewportHeight': viewportHeight,
      'screenResolutionWidth': screenResolutionWidth,
      'screenResolutionHeight': screenResolutionHeight,
      'colorDepth': colorDepth,
      'timezone': timezone,
      'language': language,
      'ipAddress': ipAddress,
      'userAgent': userAgent,
      'networkUserId': networkUserId,
      'domainUserId': domainUserId,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Subject &&
          userId == other.userId &&
          viewportWidth == other.viewportWidth &&
          viewportHeight == other.viewportHeight &&
          screenResolutionWidth == other.screenResolutionWidth &&
          screenResolutionHeight == other.screenResolutionHeight &&
          colorDepth == other.colorDepth &&
          timezone == other.timezone &&
          language == other.language &&
          ipAddress == other.ipAddress &&
          userAgent == other.userAgent &&
          networkUserId == other.networkUserId &&
          domainUserId == other.domainUserId;

  @override
  int get hashCode =>
      userId.hashCode ^
      viewportWidth.hashCode ^
      viewportHeight.hashCode ^
      screenResolutionWidth.hashCode ^
      screenResolutionHeight.hashCode ^
      colorDepth.hashCode ^
      timezone.hashCode ^
      language.hashCode ^
      ipAddress.hashCode ^
      userAgent.hashCode ^
      networkUserId.hashCode ^
      domainUserId.hashCode;
}
