import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'self_describing_json.dart';

/// [PageViewEvent] event.
@immutable
class PageViewEvent implements AbstractEvent {
  /// [pageUrl] The URL of the page.
  final String pageUrl;

  /// [pageTitle] The title of the page.
  final String? pageTitle;

  /// [referrer] The page view referrer.
  final String? referrer;

  @override
  final Set<SelfDescribingJson> contexts;

  /// Create a [PageViewEvent] event.
  PageViewEvent({
    required this.pageUrl,
    this.pageTitle,
    this.referrer,
    this.contexts = const {},
  }) : assert(pageUrl.isNotEmpty, 'pageUrl cannot be null or empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'pageUrl': pageUrl,
      'pageTitle': pageTitle,
      'referrer': referrer,
      'contexts': contexts.map((context) => context.toMap()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageViewEvent &&
          pageUrl == other.pageUrl &&
          pageTitle == other.pageTitle &&
          referrer == other.referrer &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      pageUrl.hashCode ^
      pageTitle.hashCode ^
      referrer.hashCode ^
      contexts.hashCode;

  @override
  PageViewEvent attach({
    required Set<SelfDescribingJson> contexts,
  }) =>
      PageViewEvent(
        pageUrl: pageUrl,
        pageTitle: pageTitle,
        referrer: referrer,
        contexts: this.contexts.union(contexts),
      );
}
