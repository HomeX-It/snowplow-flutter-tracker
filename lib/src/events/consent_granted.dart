import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'consent_document.dart';
import 'self_describing_json.dart';

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

  @override
  final List<SelfDescribingJson> contexts;

  /// Create a [ConsentGranted] event
  ConsentGranted({
    required this.documentId,
    required this.documentVersion,
    this.expiry,
    this.documentName,
    this.documentDescription,
    this.consentDocuments = const [],
    this.contexts = const [],
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
      'contexts': contexts.map((context) => context.toMap()).toList(),
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentGranted &&
          runtimeType == other.runtimeType &&
          expiry == other.expiry &&
          documentId == other.documentId &&
          documentVersion == other.documentVersion &&
          documentName == other.documentName &&
          documentDescription == other.documentDescription &&
          consentDocuments == other.consentDocuments &&
          contexts == other.contexts;

  @override
  int get hashCode =>
      documentId.hashCode ^
      documentVersion.hashCode ^
      expiry.hashCode ^
      documentName.hashCode ^
      documentDescription.hashCode ^
      consentDocuments.hashCode ^
      contexts.hashCode;

  @override
  ConsentGranted attach({
    required List<SelfDescribingJson> contexts,
  }) =>
      ConsentGranted(
        expiry: expiry,
        documentId: documentId,
        documentVersion: documentVersion,
        documentName: documentName,
        documentDescription: documentDescription,
        consentDocuments: consentDocuments,
        contexts: this.contexts + contexts,
      );
}
