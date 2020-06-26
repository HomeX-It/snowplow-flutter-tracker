import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'http_method.g.dart';

class HttpMethod extends EnumClass {
	static Serializer<HttpMethod> get serializer => _$httpMethodSerializer;

	@BuiltValueEnumConst(wireName: 'GET')
	static const HttpMethod GET = _$get;

	@BuiltValueEnumConst(wireName: 'POST')
	static const HttpMethod POST = _$post;

	const HttpMethod._(String name) : super(name);

	static BuiltSet<HttpMethod> get values => _$values;
	static HttpMethod valueOf(String name) => _$valueOf(name);
}