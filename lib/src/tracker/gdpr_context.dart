import 'package:flutter/foundation.dart';

/// [GDPRLegalBasis] An enum for legal bases for processing.
/// In accordance with the five [legal bases for processing](https://ico.org.uk/for-organisations/guide-to-data-protection/guide-to-the-general-data-protection-regulation-gdpr/lawful-basis-for-processing/).
@immutable
class GDPRLegalBasis {
  /// Raw string value
  final String value;

  const GDPRLegalBasis._(this.value);

  /// **Consent:** the individual has given clear consent for you to process their personal data
  /// for a specific purpose.
  static const consent = GDPRLegalBasis._('consent');

  /// **Contract:** the processing is necessary for a contract you have with the individual,
  /// or because they have asked you to take specific steps before entering into a contract.
  static const contract = GDPRLegalBasis._('contract');

  /// **Legal obligation:** the processing is necessary for you to comply with
  /// the law (not including contractual obligations).
  static const legalObligation = GDPRLegalBasis._('legal_obligation');

  /// **Vital interests:** the processing is necessary to protect someone’s life.
  static const vitalInterests = GDPRLegalBasis._('vital_interests');

  /// **Public task:** the processing is necessary for you to perform
  /// a task in the public interest or for your official functions,
  /// and the task or function has a clear basis in law.
  static const publicTask = GDPRLegalBasis._('public_task');

  /// **Legitimate interests:** the processing is necessary for your legitimate interests or the legitimate interests of a third party, unless there is a good reason to protect the individual’s personal data which overrides those legitimate interests.
  /// (This cannot apply if you are a public authority processing data to perform your official tasks.)
  static const legitimateInterests = GDPRLegalBasis._('legitimate_interests');
}

/// [DevicePlatforms] An enum for device platform types.
@immutable
class GDPRContext {
  /// GDPR Basis for processing.
  final GDPRLegalBasis basis;

  /// ID of a GDPR basis document.
  final String? documentId;

  /// Version of the document.
  final String? documentVersion;

  /// Description of the document.
  final String? documentDescription;

  /// Creates a [GDPRContext]
  GDPRContext({
    required this.basis,
    this.documentId,
    this.documentVersion,
    this.documentDescription,
  });

  /// [toMap] Converts the tracker object to JSON.
  Map<String, Object?> toMap() {
    return <String, Object?>{
      'basis': basis.value,
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentDescription': documentDescription,
    };
  }
}
