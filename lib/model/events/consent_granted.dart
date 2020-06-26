import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';
import 'package:snowplow_flutter_tracker/model/events/consent_document.dart';

class ConsentGranted extends AbstractEvent {
  final String expiry;
  final String documentId;
  final String documentVersion;
  final String documentName;
  final String documentDescription;
  final List<ConsentDocument> consentDocuments;

  ConsentGranted._builder(ConsentGrantedBuilder builder) :
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

class ConsentGrantedBuilder {
  String _expiry;
  String _documentId;
  String _documentVersion;
  String _documentName;
  String _documentDescription;
  List<ConsentDocument> _consentDocuments;

  ConsentGrantedBuilder setExpiry(String expiry) {
    _expiry = expiry;
    return this;
  }
  ConsentGrantedBuilder setDocumentId(String documentId) {
    _documentId = documentId;
    return this;
  }
  ConsentGrantedBuilder setDocumentVersion(String documentVersion) {
    _documentVersion = documentVersion;
    return this;
  }
  ConsentGrantedBuilder setDocumentName(String documentName) {
    _documentName = documentName;
    return this;
  }
  ConsentGrantedBuilder setDocumentDescription(String documentDescription) {
    _documentDescription = documentDescription;
    return this;
  }
  ConsentGrantedBuilder setConsentDocuments(List<ConsentDocument> consentDocuments) {
    _consentDocuments = consentDocuments;
    return this;
  }

  ConsentGranted build() {
    return ConsentGranted._builder(this);
  }
}
