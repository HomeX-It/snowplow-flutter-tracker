import 'abstract_event.dart';

/// [PageView] event.
class PageView implements AbstractEvent {
  /// [pageUrl] The URL of the page.
  final String pageUrl;
  /// [pageTitle] The title of the page.
  final String pageTitle;
  /// [referrer] The page view referrer.
  final String referrer;

  PageView._builder(PageViewBuilder builder) :
      assert(builder._pageUrl != null && builder._pageUrl.isNotEmpty, 'pageUrl cannot be null or empty'),
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

/// [PageViewBuilder] The protocol for building page view events.
class PageViewBuilder {
  String _pageUrl;
  String _pageTitle;
  String _referrer;

  /// Set the URL of the page.
  PageViewBuilder setPageUrl(String pageUrl) {
    _pageUrl = pageUrl;
    return this;
  }

  /// Set the title of the page.
  PageViewBuilder setPageTitle(String pageTitle) {
    _pageTitle = pageTitle;
    return this;
  }

  /// Set the referrer of the page view.
  PageViewBuilder setReferrer(String referrer) {
    _referrer = referrer;
    return this;
  }

  /// A page view.
  PageView build() {
    return PageView._builder(this);
  }
}
