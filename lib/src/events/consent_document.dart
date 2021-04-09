import 'package:flutter/foundation.dart';

/// [ConsentDocument]
@immutable
class ConsentDocument {
  /// [documentId] The document ID.
  final String? documentId;

  /// [documentVersion] The version of the document.
  final String? documentVersion;

  /// [documentName] Name of the consent document.
  final String? documentName;

  /// [documentDescription] The consent document description.
  final String? documentDescription;

  /// Create a [ConsentDocument]
  const ConsentDocument({
    this.documentId,
    this.documentVersion,
    this.documentName,
    this.documentDescription,
  });

  /// Converts the consent document object to JSON.
  Map<String, Object?> toMap() {
    return {
      'documentId': documentId,
      'documentVersion': documentVersion,
      'documentName': documentName,
      'documentDescription': documentDescription,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConsentDocument &&
          runtimeType == other.runtimeType &&
          documentId == other.documentId &&
          documentVersion == other.documentVersion &&
          documentName == other.documentName &&
          documentDescription == other.documentDescription;

  @override
  int get hashCode =>
      documentId.hashCode ^
      documentVersion.hashCode ^
      documentName.hashCode ^
      documentDescription.hashCode;
}
