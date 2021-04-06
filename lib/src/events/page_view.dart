import 'package:flutter/foundation.dart';

import 'abstract_event.dart';

/// [PageViewEvent] event.
@immutable
class PageViewEvent implements AbstractEvent {
  /// [pageUrl] The URL of the page.
  final String pageUrl;

  /// [pageTitle] The title of the page.
  final String? pageTitle;

  /// [referrer] The page view referrer.
  final String? referrer;

  /// Create a [PageViewEvent] event.
  PageViewEvent({
    required this.pageUrl,
    this.pageTitle,
    this.referrer,
  }) : assert(pageUrl.isNotEmpty, 'pageUrl cannot be null or empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'pageUrl': pageUrl,
      'pageTitle': pageTitle,
      'referrer': referrer,
    };
  }
}
