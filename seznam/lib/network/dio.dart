import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seznam/core/constants/constants.dart';
import 'package:seznam/network/logging_interceptor.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: const Duration(milliseconds: Constants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: Constants.receiveTimeout),
    ),
  )..interceptors.add(LoggingInterceptor());

  Dio get dio => _dio;
}
