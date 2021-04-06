import 'package:flutter/foundation.dart';

/// [NotificationContent]
@immutable
class NotificationContent {
  /// [title] Title displayed in notification.
  final String? title;

  /// [subtitle] Subtitle displayed.
  final String? subtitle;

  /// [body] Body message.
  final String? body;

  /// [badge] Badge count of the app.
  final int? badge;

  /// [sound] Name of the notification sound.
  final String? sound;

  /// [launchImageName] The launchImageName member of a UNNotificationContent object.
  final String? launchImageName;

  /// [userInfo] The UserInfo map.
  final Map<String, Object>? userInfo;

  /// [attachments] Attachments displayed with notification.
  final List<Object>? attachments;

  /// Create a [NotificationContent]
  NotificationContent({
    this.title,
    this.subtitle,
    this.body,
    this.badge,
    this.sound,
    this.launchImageName,
    this.userInfo,
    this.attachments,
  });

  /// Converts the notification content object to JSON.
  Map<String, Object?> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'body': body,
      'badge': badge,
      'sound': sound,
      'launchImageName': launchImageName,
      'userInfo': userInfo,
      'attachments': attachments,
    };
  }
}
