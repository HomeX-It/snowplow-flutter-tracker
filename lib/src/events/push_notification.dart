import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'notification_content.dart';
import 'self_describing_json.dart';

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

  @override
  final Set<SelfDescribingJson> contexts;

  /// Creates a [PushNotification] event
  const PushNotification({
    this.action,
    this.deliveryDate,
    this.trigger,
    this.categoryIdentifier,
    this.threadIdentifier,
    this.notificationContent,
    this.contexts = const {},
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
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PushNotification &&
          action == other.action &&
          deliveryDate == other.deliveryDate &&
          trigger == other.trigger &&
          categoryIdentifier == other.categoryIdentifier &&
          threadIdentifier == other.threadIdentifier &&
          notificationContent == other.notificationContent &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      action.hashCode ^
      deliveryDate.hashCode ^
      trigger.hashCode ^
      categoryIdentifier.hashCode ^
      threadIdentifier.hashCode ^
      notificationContent.hashCode ^
      contexts.hashCode;

  @override
  PushNotification attach({
    required Set<SelfDescribingJson> contexts,
  }) =>
      PushNotification(
        action: action,
        deliveryDate: deliveryDate,
        trigger: trigger,
        categoryIdentifier: categoryIdentifier,
        threadIdentifier: threadIdentifier,
        notificationContent: notificationContent,
        contexts: this.contexts.union(contexts),
      );
}
