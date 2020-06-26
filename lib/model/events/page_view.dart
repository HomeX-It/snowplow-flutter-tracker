import 'package:flutter/foundation.dart';

import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class PageView extends AbstractEvent {
  final String pageUrl;
  final String pageTitle;
  final String referrer;

  const PageView({@required this.pageUrl, @required this.pageTitle, @required this.referrer});

  PageView._builder(PageViewBuilder builder) :
      pageUrl = builder._pageUrl,
      pageTitle = builder._pageTitle,
      referrer = builder._referrer;

  @override
  Map<String, Object> toMap() {
    return {
      'pageUrl': pageUrl,
      'pageTitle': pageTitle,
      'referrer': referrer,
    };
  }
}

class PageViewBuilder {
  String _pageUrl;
  String _pageTitle;
  String _referrer;

  PageViewBuilder setPageUrl(String pageUrl) {
    _pageUrl = pageUrl;
    return this;
  }

  PageViewBuilder setPageTitle(String pageTitle) {
    _pageTitle = pageTitle;
    return this;
  }

  PageViewBuilder setReferrer(String referrer) {
    _referrer = referrer;
    return this;
  }

  PageView build() {
    return PageView._builder(this);
  }
}
