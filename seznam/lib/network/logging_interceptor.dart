import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  final logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('REQUEST[${options.method}] => PATH: ${options.path}');
    logger.i('Headers: ${options.headers}');
    if (options.data != null) {
      logger.i('Request Body: ${options.data}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    logger.i('Response Body: ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    logger.e('Error Message: ${err.message}');
    if (err.response?.data != null) {
      logger.e('Error Response Body: ${err.response?.data}');
    }
    return super.onError(err, handler);
  }
}
