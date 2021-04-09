import 'dart:cli';
import 'dart:async';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:stack_trace/stack_trace.dart';

void main() async {
  var handler =
      const Pipeline().addMiddleware(_logRequests()).addHandler(_echoRequest);

  var server = await io.serve(handler, '127.0.0.1', 8080);
  server.autoCompress = true;

  print('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) {
  return Response.ok('Request for "${request.url}"');
}

Middleware _logRequests() {
  return (innerHandler) {
    return (request) {
      return Future.sync(() => innerHandler(request)).then((response) {
        var msg = _message(
          response.statusCode,
          request.requestedUri,
          request.method,
          waitFor<String>(request.readAsString()),
        );

        print(msg);

        return response;
      }, onError: (Object error, StackTrace stackTrace) {
        if (error is HijackException) throw error;

        var msg = _errorMessage(
            request.requestedUri, request.method, error, stackTrace);

        print('[ERROR] $msg');

        throw error;
      });
    };
  };
}

String _formatQuery(String query) {
  return query == '' ? '' : '?$query';
}

String _message(
  int statusCode,
  Uri requestedUri,
  String method,
  String body,
) {
  return '${method.padRight(7)} [$statusCode] ' // 7 - longest standard HTTP method
      'PATH: ${requestedUri.path}${_formatQuery(requestedUri.query)} '
      '${body.isNotEmpty ? 'BODY: $body' : ''}';
}

String _errorMessage(
  Uri requestedUri,
  String method,
  Object error,
  StackTrace? stack,
) {
  var chain = Chain.current();
  if (stack != null) {
    chain = Chain.forTrace(stack)
        .foldFrames((frame) => frame.isCore || frame.package == 'shelf')
        .terse;
  }

  var msg = '$method\t${requestedUri.path}'
      '${_formatQuery(requestedUri.query)}\n$error';

  return '$msg\n$chain';
}
