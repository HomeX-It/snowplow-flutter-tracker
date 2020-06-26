import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';

class ConsentDocument extends AbstractEvent {
	final String documentId;
	final String documentVersion;
	final String documentName;
	final String documentDescription;

	ConsentDocument._builder(ConsentDocumentBuilder builder) :
			documentId = builder._documentId,
			documentVersion = builder._documentVersion,
			documentName = builder._documentName,
			documentDescription = builder._documentDescription;

	@override
  Map<String, Object> toMap() {
    return {
			'documentId': documentId,
			'documentVersion': documentVersion,
			'documentName': documentName,
			'documentDescription': documentDescription,
		};
  }
}

class ConsentDocumentBuilder {
	String _documentId;
	String _documentVersion;
	String _documentName;
	String _documentDescription;

	ConsentDocumentBuilder setDocumentId(String documentId) {
		_documentId = documentId;
		return this;
	}

	ConsentDocumentBuilder setDocumentVersion(String documentVersion) {
		_documentVersion = documentVersion;
		return this;
	}

	ConsentDocumentBuilder setDocumentName(String documentName) {
		_documentName = documentName;
		return this;
	}

	ConsentDocumentBuilder setDocumentDescription(String documentDescription) {
		_documentDescription = documentDescription;
		return this;
	}

	ConsentDocument build() {
		return ConsentDocument._builder(this);
	}
}