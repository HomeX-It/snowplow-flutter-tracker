import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'consent_document.dart';

/// [ConsentGranted] event
@immutable
class ConsentGranted implements AbstractEvent {
  /// [documentId] The associated consent document ID.
  final String documentId;

  /// [documentVersion] The associated consent document version.
  final String documentVersion;

  /// [expiry] The associated consent document expiry.
  final String? expiry;

  /// [documentName] The associated consent document name.
  final String? documentName;

  /// [documentDescription] The associated consent document description.
  final String? documentDescription;

  /// [consentDocuments] An array of associated consent documents.
  final List<ConsentDocument> consentDocuments;

  /// Create a [ConsentGranted] event
  ConsentGranted({
    required this.documentId,
    required this.documentVersion,
    this.expiry,
    this.documentName,
    this.documentDescription,
    this.consentDocuments = const [],
  })  : assert(documentId.isNotEmpty, 'documentId cannot be empty'),
        assert(documentVersion.isNotEmpty, 'documentVersion cannot be empty');

  @override
  Map<String, Object?> toMap() {
    return {
      'expiry': expiry,
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
