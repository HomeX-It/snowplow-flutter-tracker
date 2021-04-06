import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'consent_document.dart';

/// [ConsentWithdrawn] event.
@immutable
class ConsentWithdrawn implements AbstractEvent {
  /// [all] Whether all consent is to be withdrawn.
  final bool? all;

  /// [documentId] The document ID.
  final String? documentId;

  /// [documentVersion] The document's version.
  final String? documentVersion;

  /// [documentName] The name of the consent document.
  final String? documentName;

  /// [documentDescription] The consent document description.
  final String? documentDescription;

  /// [consentDocuments] An array of associated documents.
  final List<ConsentDocument> consentDocuments;

  /// Create a [ConsentWithdrawn] event
  ConsentWithdrawn({
    this.all,
    this.documentId,
    this.documentVersion,
    this.documentName,
    this.documentDescription,
    this.consentDocuments = const [],
  });

  @override
  Map<String, Object?> toMap() {
    return {
      'all': all,
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentName': documentName,
      'documentDescription': documentDescription,
      'consentDocuments': consentDocuments
          .map((ConsentDocument consentDocument) => consentDocument.toMap())
          .toList(),
    };
  }
}
