import "package:dio/dio.dart";
import "package:network/app_config.dart";

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      "Authorization": "Bearer ${AppConfig.API_KEY}"
    };
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.response?.statusCode) {
      case 400:
        print("Bad Request");
        break;
      case 401:
        print("Unauthorized");
        break;
      case 403:
        print("Forbidden");
        break;
      case 404:
        print("Not Found");
        break;
      default:
        print("Server Error");
        break;
    }
    super.onError(err, handler);
    // handler.next(err);
  }
}
