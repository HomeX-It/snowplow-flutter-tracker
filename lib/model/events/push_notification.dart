import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';
import 'package:snowplow_flutter_tracker/model/events/notification_content.dart';

/// [PushNotification] event.
class PushNotification implements AbstractEvent {
	/// [action] Action taken by the user.
	final String action;
	/// [deliveryDate] The date the notification was delivered.
	final String deliveryDate;
	/// [trigger] Event trigger (i.e. push or local trigger).
	final String trigger;
	/// [categoryIdentifier] Category Id of the notification.
	final String categoryIdentifier;
	/// [threadIdentifier] Thread Id of the notification.
	final String threadIdentifier;
	/// [notificationContent] Notification content event.
	final NotificationContent notificationContent;

	PushNotification._builder(PushNotificationBuilder builder) :
			action = builder._action,
			deliveryDate = builder._deliveryDate,
			trigger = builder._trigger,
			categoryIdentifier = builder._categoryIdentifier,
			threadIdentifier = builder._threadIdentifier,
			notificationContent = builder._notificationContent;

	@override
  Map<String, Object> toMap() {
    return {
			'action': action,
			'deliveryDate': deliveryDate,
			'trigger': trigger,
			'categoryIdentifier': categoryIdentifier,
			'threadIdentifier': threadIdentifier,
			'notificationContent': notificationContent.toMap(),
		};
  }
}

/// The protocol for building push notification events.
class PushNotificationBuilder {
	String _action;
	String _deliveryDate;
	String _trigger;
	String _categoryIdentifier;
	String _threadIdentifier;
	NotificationContent _notificationContent;

	/// Set the action.
	PushNotificationBuilder setAction(String action) {
		_action = action;
		return this;
	}

	/// Set the delivery date.
	PushNotificationBuilder setDeliveryDate(String deliveryDate) {
		_deliveryDate = deliveryDate;
		return this;
	}

	/// Set the trigger.
	PushNotificationBuilder setTrigger(String trigger) {
		_trigger = trigger;
		return this;
	}

	/// Set the category ID.
	PushNotificationBuilder setCategoryIdentifier(String categoryIdentifier) {
		_categoryIdentifier = categoryIdentifier;
		return this;
	}

	/// Set the thread ID.
	PushNotificationBuilder setThreadIdentifier(String threadIdentifier) {
		_threadIdentifier = threadIdentifier;
		return this;
	}

	/// Set the notification content.
	PushNotificationBuilder setNotificationContent(NotificationContent notificationContent) {
		_notificationContent = notificationContent;
		return this;
	}

	/// Creates a push notification event.
	PushNotification build() {
		return PushNotification._builder(this);
	}
}