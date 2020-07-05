/// [NotificationContent]
class NotificationContent {
	/// [title] Title displayed in notification.
	final String title;
	/// [subtitle] Subtitle displayed.
	final String subtitle;
	/// [body] Body message.
	final String body;
	/// [badge] Badge count of the app.
	final int badge;
	/// [sound] Name of the notification sound.
	final String sound;
	/// [launchImageName] The launchImageName member of a UNNotificationContent object.
	final String launchImageName;
	/// [userInfo] The UserInfo map.
	final Map<String, Object> userInfo;
	/// [attachments] Attachments displayed with notification.
	final List<Object> attachments;

  NotificationContent._builder(NotificationContentBuilder builder) :
			title = builder._title,
			subtitle = builder._subtitle,
			body = builder._body,
			badge = builder._badge,
			sound = builder._sound,
			launchImageName = builder._launchImageName,
			userInfo = builder._userInfo,
			attachments = builder._attachments;

	/// Converts the notification content object to JSON.
  Map<String, Object> toMap() {
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

/// The protocol for building notification content.
class NotificationContentBuilder {
	String _title;
	String _subtitle;
	String _body;
	int _badge;
	String _sound;
	String _launchImageName;
	Map<String, Object> _userInfo;
	List<Object> _attachments;

	/// Set the title.
	NotificationContentBuilder setTitle(String title) {
		_title = title;
		return this;
	}

	/// Set the subtitle.
	NotificationContentBuilder setSubtitle(String subtitle) {
		_subtitle = subtitle;
		return this;
	}

	/// Set the body.
	NotificationContentBuilder setBody(String body) {
		_body = body;
		return this;
	}

	/// Set the badge.
	NotificationContentBuilder setBadge(int badge) {
		_badge = badge;
		return this;
	}

	/// Set the sound.
	NotificationContentBuilder setSound(String sound) {
		_sound = sound;
		return this;
	}

	/// Set the launchImageName.
	NotificationContentBuilder setLaunchImageName(String launchImageName) {
		_launchImageName = launchImageName;
		return this;
	}

	/// Set the UserInfo map.
	NotificationContentBuilder setUserInfo(Map<String, Object> userInfo) {
		_userInfo = userInfo;
		return this;
	}

	/// Set attachments.
	NotificationContentBuilder setAttachments(List<Object> attachments) {
		_attachments = attachments;
		return this;
	}

	/// Creates a notification content.
	NotificationContent build() {
		return NotificationContent._builder(this);
	}
}