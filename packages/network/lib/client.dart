import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'app_config.dart';
import 'dio_interceptor.dart';

class DioClient {
  static DioClient? _dioClient;
  static late Dio _dio;

  factory DioClient() {
    _dioClient ??= DioClient._internal();
    return _dioClient!;
  }

  DioClient._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: AppConfig.BASE_URL,
      connectTimeout: const Duration(milliseconds: AppConfig.CONNECT_TIMEOUT),
      //receiveTimeout: const Duration(milliseconds: AppConfig.CONNECT_TIMEOUT),
      responseType: ResponseType.json,
    ));
    _dio.interceptors
      ..add(DioInterceptor())
      ..add(PrettyDioLogger(
          requestHeader: true, requestBody: true, compact: false));
  }

  getDio() {
    return _dio;
  }
}
