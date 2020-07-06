/// [ConsentDocument]
class ConsentDocument {
  /// [documentId] The document ID.
  final String documentId;

  /// [documentVersion] The version of the document.
  final String documentVersion;

  /// [documentName] Name of the consent document.
  final String documentName;

  /// [documentDescription] The consent document description.
  final String documentDescription;

  ConsentDocument._builder(ConsentDocumentBuilder builder)
      : documentId = builder._documentId,
        documentVersion = builder._documentVersion,
        documentName = builder._documentName,
        documentDescription = builder._documentDescription;

  /// Converts the consent document object to JSON.
  Map<String, Object> toMap() {
    return {
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentName': documentName,
      'documentDescription': documentDescription,
    };
  }
}

/// The protocol for building consent documents.
class ConsentDocumentBuilder {
  String _documentId;
  String _documentVersion;
  String _documentName;
  String _documentDescription;

  /// Set the ID associated with a document that defines consent.
  ConsentDocumentBuilder setDocumentId(String documentId) {
    _documentId = documentId;
    return this;
  }

  /// Set the version of the consent document.
  ConsentDocumentBuilder setDocumentVersion(String documentVersion) {
    _documentVersion = documentVersion;
    return this;
  }

  /// Set the name of the consent document.
  ConsentDocumentBuilder setDocumentName(String documentName) {
    _documentName = documentName;
    return this;
  }

  /// Set the description of the consent document.
  ConsentDocumentBuilder setDocumentDescription(String documentDescription) {
    _documentDescription = documentDescription;
    return this;
  }

  /// Creates a consent document.
  ConsentDocument build() {
    return ConsentDocument._builder(this);
  }
}
