class Subject {
	final String userId;
	final int viewportWidth;
	final int viewportHeight;
	final int screenResolutionWidth;
	final int screenResolutionHeight;
	final int colorDepth;
	final String timezone;
	final String language;
	final String ipAddress;
	final String userAgent;
	final String networkUserId;
	final String domainUserId;

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

	SubjectBuilder setUserId(String userId) {
		_userId = userId;
		return this;
	}

	SubjectBuilder setViewport(int width, int height) {
		_viewportWidth = width;
		_viewportHeight = height;
		return this;
	}

	SubjectBuilder setScreenResolution(int width, int height) {
		_screenResolutionWidth = width;
		_screenResolutionHeight = height;
		return this;
	}

	SubjectBuilder setColorDepth(int colorDepth) {
		_colorDepth = colorDepth;
		return this;
	}

	SubjectBuilder setTimezone(String timezone) {
		_timezone = timezone;
		return this;
	}

	SubjectBuilder setLanguage(String language) {
		_language = language;
		return this;
	}

	SubjectBuilder setIpAddress(String ipAddress) {
		_ipAddress = ipAddress;
		return this;
	}

	SubjectBuilder setUserAgent(String userAgent) {
		_userAgent = userAgent;
		return this;
	}

	SubjectBuilder setNetworkUserId(String networkUserId) {
		_networkUserId = networkUserId;
		return this;
	}

	SubjectBuilder setDomainUserId(String domainUserId) {
		_domainUserId = domainUserId;
		return this;
	}

	Subject build() {
		return Subject._builder(this);
	}
}