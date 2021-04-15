import 'package:flutter/foundation.dart';

import 'abstract_event.dart';
import 'consent_document.dart';
import 'self_describing_json.dart';

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

  @override
  final Set<SelfDescribingJson> contexts;

  /// Create a [ConsentWithdrawn] event
  const ConsentWithdrawn({
    this.all,
    this.documentId,
    this.documentVersion,
    this.documentName,
    this.documentDescription,
    this.consentDocuments = const [],
    this.contexts = const {},
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
      'contexts': contexts.map((context) => context.toMap()).toList()
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentWithdrawn &&
          runtimeType == other.runtimeType &&
          all == other.all &&
          documentId == other.documentId &&
          documentVersion == other.documentVersion &&
          documentName == other.documentName &&
          documentDescription == other.documentDescription &&
          listEquals(consentDocuments, other.consentDocuments) &&
          setEquals(contexts, other.contexts);

  @override
  int get hashCode =>
      all.hashCode ^
      documentId.hashCode ^
      documentVersion.hashCode ^
      documentName.hashCode ^
      documentDescription.hashCode ^
      consentDocuments.hashCode ^
      contexts.hashCode;

  @override
  ConsentWithdrawn attach({
    required Set<SelfDescribingJson> contexts,
  }) =>
      ConsentWithdrawn(
        all: all,
        documentId: documentId,
        documentVersion: documentVersion,
        documentName: documentName,
        documentDescription: documentDescription,
        consentDocuments: consentDocuments,
        contexts: this.contexts.union(contexts),
      );
}
