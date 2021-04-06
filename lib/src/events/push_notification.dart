import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'notification_content.dart';

/// [PushNotification] event.
@immutable
class PushNotification implements AbstractEvent {
  /// [action] Action taken by the user.
  final String? action;

  /// [deliveryDate] The date the notification was delivered.
  final String? deliveryDate;

  /// [trigger] Event trigger (i.e. push or local trigger).
  final String? trigger;

  /// [categoryIdentifier] Category Id of the notification.
  final String? categoryIdentifier;

  /// [threadIdentifier] Thread Id of the notification.
  final String? threadIdentifier;

  /// [notificationContent] Notification content event.
  final NotificationContent? notificationContent;

  /// Creates a [PushNotification] event
  PushNotification({
    this.action,
    this.deliveryDate,
    this.trigger,
    this.categoryIdentifier,
    this.threadIdentifier,
    this.notificationContent,
  });

  @override
  Map<String, Object?> toMap() {
    return {
      'action': action,
      'deliveryDate': deliveryDate,
      'trigger': trigger,
      'categoryIdentifier': categoryIdentifier,
      'threadIdentifier': threadIdentifier,
      'notificationContent': notificationContent?.toMap(),
    };
  }
}
