import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'request_security.g.dart';

class RequestSecurity extends EnumClass {
	static Serializer<RequestSecurity> get serializer => _$requestSecuritySerializer;

	@BuiltValueEnumConst(wireName: 'HTTP')
	static const RequestSecurity HTTP = _$http;

	@BuiltValueEnumConst(wireName: 'HTTPS')
	static const RequestSecurity HTTPS = _$https;

	const RequestSecurity._(String name) : super(name);

	static BuiltSet<RequestSecurity> get values => _$values;
	static RequestSecurity valueOf(String name) => _$valueOf(name);
}