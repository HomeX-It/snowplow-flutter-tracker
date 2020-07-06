import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'http_method.g.dart';

/// [HttpMethod] An enum for HTTP method types.
class HttpMethod extends EnumClass {
  /// [GET] GET request.
  @BuiltValueEnumConst(wireName: 'GET')
  static const HttpMethod GET = _$get;

  /// [POST] POST request.
  @BuiltValueEnumConst(wireName: 'POST')
  static const HttpMethod POST = _$post;

  const HttpMethod._(String name) : super(name);

  /// [values] Returns all values.
  static BuiltSet<HttpMethod> get values => _$values;

  /// [valueOf] Makes [HttpMethod] from the value.
  static HttpMethod valueOf(String name) => _$valueOf(name);
}
