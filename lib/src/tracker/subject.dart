/// [Subject] This class is used to access and persist user information, it represents the current user being tracked.
class Subject {
	/// [userId] The user's ID.
	final String userId;
	/// [viewportWidth] The viewport width in pixels.
	final int viewportWidth;
	/// [viewportHeight] The viewport height in pixels.
	final int viewportHeight;
	/// [screenResolutionWidth] The screen resolution width in pixels.
	final int screenResolutionWidth;
	/// [screenResolutionHeight] The screen resolution height in pixels.
	final int screenResolutionHeight;
	/// [colorDepth] The user's color depth.
	final int colorDepth;
	/// [timezone] The user's timezone.
	final String timezone;
	/// [language] The user's language.
	final String language;
	/// [ipAddress] The user's IP address.
	final String ipAddress;
	/// [userAgent] The user agent (also known as browser string).
	final String userAgent;
	/// [networkUserId] The network UID.
	final String networkUserId;
	/// [domainUserId] The domain UID.
	final String domainUserId;

	Subject._builder(SubjectBuilder builder) :
			userId = builder._userId,
			viewportWidth = builder._viewportWidth,
			viewportHeight = builder._viewportHeight,
			screenResolutionWidth = builder._screenResolutionWidth,
			screenResolutionHeight = builder._screenResolutionHeight,
			colorDepth = builder._colorDepth,
			timezone = builder._timezone,
			language = builder._language,
			ipAddress = builder._ipAddress,
			userAgent = builder._userAgent,
			networkUserId = builder._networkUserId,
			domainUserId = builder._domainUserId;

	/// [toMap] Converts the subject object to JSON.
	Map<String, Object> toMap() {
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
}

/// [SubjectBuilder] The protocol for building subject.
class SubjectBuilder {
	String _userId;
	int _viewportWidth;
	int _viewportHeight;
	int _screenResolutionWidth;
	int _screenResolutionHeight;
	int _colorDepth;
	String _timezone;
	String _language;
	String _ipAddress;
	String _userAgent;
	String _networkUserId;
	String _domainUserId;

	/// [setUserId] Sets the user ID.
	SubjectBuilder setUserId(String userId) {
		_userId = userId;
		return this;
	}

	/// [setViewport] Sets the viewport dimensions.
	SubjectBuilder setViewport(int width, int height) {
		_viewportWidth = width;
		_viewportHeight = height;
		return this;
	}

	/// [setScreenResolution] Sets the screen resolution.
	SubjectBuilder setScreenResolution(int width, int height) {
		_screenResolutionWidth = width;
		_screenResolutionHeight = height;
		return this;
	}

	/// [setColorDepth] Sets the color depth.
	SubjectBuilder setColorDepth(int colorDepth) {
		_colorDepth = colorDepth;
		return this;
	}

	/// [setTimezone] Sets the timezone.
	SubjectBuilder setTimezone(String timezone) {
		_timezone = timezone;
		return this;
	}

	/// [setLanguage] Sets the language.
	SubjectBuilder setLanguage(String language) {
		_language = language;
		return this;
	}

	/// [setIpAddress] Sets the IP Address.
	SubjectBuilder setIpAddress(String ipAddress) {
		_ipAddress = ipAddress;
		return this;
	}

	/// [setUserAgent] Sets the user agent (also known as browser string).
	SubjectBuilder setUserAgent(String userAgent) {
		_userAgent = userAgent;
		return this;
	}

	/// [setNetworkUserId] Sets the Network User ID.
	SubjectBuilder setNetworkUserId(String networkUserId) {
		_networkUserId = networkUserId;
		return this;
	}

	/// [setDomainUserId] Sets the Domain User ID.
	SubjectBuilder setDomainUserId(String domainUserId) {
		_domainUserId = domainUserId;
		return this;
	}

	/// [build] Creates a subject.
	Subject build() {
		return Subject._builder(this);
	}
}