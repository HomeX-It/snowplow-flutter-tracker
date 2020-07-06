import 'abstract_event.dart';
import 'consent_document.dart';

/// [ConsentWithdrawn] event.
class ConsentWithdrawn implements AbstractEvent {
  /// [all] Whether all consent is to be withdrawn.
  final bool all;

  /// [documentId] The document ID.
  final String documentId;

  /// [documentVersion] The document's version.
  final String documentVersion;

  /// [documentName] The name of the consent document.
  final String documentName;

  /// [documentDescription] The consent document description.
  final String documentDescription;

  /// [consentDocuments] An array of associated documents.
  final List<ConsentDocument> consentDocuments;

  ConsentWithdrawn._builder(ConsentWithdrawnBuilder builder)
      : all = builder._all,
        documentId = builder._documentId,
        documentVersion = builder._documentVersion,
        documentName = builder._documentName,
        documentDescription = builder._documentDescription,
        consentDocuments = builder._consentDocuments;

  @override
  Map<String, Object> toMap() {
    return {
      'all': all,
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentName': documentName,
      'documentDescription': documentDescription,
      'consentDocuments':
          consentDocuments.map((ConsentDocument consentDocument) {
        return consentDocument.toMap();
      }).toList(),
    };
  }
}

/// The protocol for building consent withdrawn events.
class ConsentWithdrawnBuilder {
  bool _all;
  String _documentId;
  String _documentVersion;
  String _documentName;
  String _documentDescription;
  List<ConsentDocument> _consentDocuments;

  /// Set whether to withdraw all consent to tracking.
  ConsentWithdrawnBuilder setAll(bool all) {
    _all = all;
    return this;
  }

  /// Set the ID associated with a document for withdrawing consent.
  ConsentWithdrawnBuilder setDocumentId(String documentId) {
    _documentId = documentId;
    return this;
  }

  /// Set the version of the document.
  ConsentWithdrawnBuilder setDocumentVersion(String documentVersion) {
    _documentVersion = documentVersion;
    return this;
  }

  /// Set the name of the consent document.
  ConsentWithdrawnBuilder setDocumentName(String documentName) {
    _documentName = documentName;
    return this;
  }

  /// Set the description of the consent document.
  ConsentWithdrawnBuilder setDocumentDescription(String documentDescription) {
    _documentDescription = documentDescription;
    return this;
  }

  /// Set additional documents associated to the consent withdrawn event.
  ConsentWithdrawnBuilder setConsentDocuments(
      List<ConsentDocument> consentDocuments) {
    _consentDocuments = consentDocuments;
    return this;
  }

  /// A consent withdrawn event.
  ConsentWithdrawn build() {
    return ConsentWithdrawn._builder(this);
  }
}
