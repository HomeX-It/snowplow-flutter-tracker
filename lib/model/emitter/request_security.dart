import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'request_security.g.dart';

/// [RequestSecurity] An enum for HTTP security.
class RequestSecurity extends EnumClass {
	/// [HTTP] Use HTTP.
	@BuiltValueEnumConst(wireName: 'HTTP')
	static const RequestSecurity HTTP = _$http;

	/// [HTTPS] Use HTTP over TLS.
	@BuiltValueEnumConst(wireName: 'HTTPS')
	static const RequestSecurity HTTPS = _$https;

	const RequestSecurity._(String name) : super(name);

	/// [values] Returns all values.
	static BuiltSet<RequestSecurity> get values => _$values;

	/// [valueOf] Makes [RequestSecurity] from the value.
	static RequestSecurity valueOf(String name) => _$valueOf(name);
}