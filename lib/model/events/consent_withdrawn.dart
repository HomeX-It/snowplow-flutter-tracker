import 'package:snowplow_flutter_tracker/model/events/abstract_event.dart';
import 'package:snowplow_flutter_tracker/model/events/consent_document.dart';

class ConsentWithdrawn extends AbstractEvent {
	final bool all;
	final String documentId;
	final String documentVersion;
	final String documentName;
	final String documentDescription;
	final List<ConsentDocument> consentDocuments;

	ConsentWithdrawn._builder(ConsentWithdrawnBuilder builder) :
			all = builder._all,
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
			'consentDocuments': consentDocuments.map((ConsentDocument consentDocument) {
			  return consentDocument.toMap();
			}).toList(),
		};
  }
}

class ConsentWithdrawnBuilder {
	bool _all;
	String _documentId;
	String _documentVersion;
	String _documentName;
	String _documentDescription;
	List<ConsentDocument> _consentDocuments;

	ConsentWithdrawnBuilder setAll(bool all) {
		_all = all;
		return this;
	}

	ConsentWithdrawnBuilder setDocumentId(String documentId) {
		_documentId = documentId;
		return this;
	}

	ConsentWithdrawnBuilder setDocumentVersion(String documentVersion) {
		_documentVersion = documentVersion;
		return this;
	}

	ConsentWithdrawnBuilder setDocumentName(String documentName) {
		_documentName = documentName;
		return this;
	}

	ConsentWithdrawnBuilder setDocumentDescription(String documentDescription) {
		_documentDescription = documentDescription;
		return this;
	}

	ConsentWithdrawnBuilder setConsentDocuments(List<ConsentDocument> consentDocuments) {
		_consentDocuments = consentDocuments;
		return this;
	}

	ConsentWithdrawn build() {
		return ConsentWithdrawn._builder(this);
	}
}