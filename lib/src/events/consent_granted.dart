import 'abstract_event.dart';
import 'consent_document.dart';

/// [ConsentGranted] event
class ConsentGranted implements AbstractEvent {
  /// [expiry] The associated consent document expiry.
  final String expiry;
  /// [documentId] The associated consent document ID.
  final String documentId;
  /// [documentVersion] The associated consent document version.
  final String documentVersion;
  /// [documentName] The associated consent document name.
  final String documentName;
  /// [documentDescription] The associated consent document description.
  final String documentDescription;
  /// [consentDocuments] An array of associated consent documents.
  final List<ConsentDocument> consentDocuments;

  ConsentGranted._builder(ConsentGrantedBuilder builder) :
      assert(builder._documentId != null && builder._documentId.isNotEmpty, 'documentId cannot be null or empty'),
      assert(builder._documentVersion != null && builder._documentVersion.isNotEmpty, 'documentVersion cannot be null or empty'),
      expiry = builder._expiry,
      documentId = builder._documentId,
      documentVersion = builder._documentVersion,
      documentName = builder._documentName,
      documentDescription = builder._documentDescription,
      consentDocuments = builder._consentDocuments;

  @override
  Map<String, Object> toMap() {
    return {
      'expiry': expiry,
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentName': documentName,
      'documentDescription': documentDescription,
      'consentDocuments': consentDocuments.map((ConsentDocument consentDocument) {
        return consentDocument.toMap();
      }).toList(),
    };
  }
}

/// The protocol for building consent granted events.
class ConsentGrantedBuilder {
  String _expiry;
  String _documentId;
  String _documentVersion;
  String _documentName;
  String _documentDescription;
  List<ConsentDocument> _consentDocuments;

  /// Set the expiry of the associated consent document.
  ConsentGrantedBuilder setExpiry(String expiry) {
    _expiry = expiry;
    return this;
  }

  /// Set the ID of the associated consent document.
  ConsentGrantedBuilder setDocumentId(String documentId) {
    _documentId = documentId;
    return this;
  }

  /// Set the version of the associated consent document.
  ConsentGrantedBuilder setDocumentVersion(String documentVersion) {
    _documentVersion = documentVersion;
    return this;
  }

  /// Set the name of the associated consent document.
  ConsentGrantedBuilder setDocumentName(String documentName) {
    _documentName = documentName;
    return this;
  }

  /// Set the description of the associated consent document.
  ConsentGrantedBuilder setDocumentDescription(String documentDescription) {
    _documentDescription = documentDescription;
    return this;
  }

  /// Set additional associated consent documents.
  ConsentGrantedBuilder setConsentDocuments(List<ConsentDocument> consentDocuments) {
    _consentDocuments = consentDocuments;
    return this;
  }

  /// Creates a consent granted event.
  ConsentGranted build() {
    return ConsentGranted._builder(this);
  }
}
