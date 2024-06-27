import 'package:dio/dio.dart';

import '../utils/logger.dart';

class AppInterceptorLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i(
      '*** Request ***\nREQUEST[${options.method}] => ${options.uri}',
    );
    if (options.method == 'POST' || options.method == 'PUT') {
      if (options.data is FormData) {
        Map<String, dynamic> params = {};
        for (var element in (options.data as FormData).fields) {
          params[element.key] = element.value;
        }
        logger.i(
          '*** PARAMS ***\n$params',
        );
      } else {
        logger.i(
          '*** PARAMS ***\n${options.data}',
        );
      }
    } else if (options.method == 'GET') {
      logger.i(
        '*** PARAMS ***\n${options.queryParameters}',
      );
    }
    logger.i(
      '*** HEADERS ***\n${options.headers}',
    );
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
      '*** Response ***\nRESPONSE[${response.statusCode}] => ${response.realUri}\n${response.data.toString()}',
    );
    response.data['statusCode'] = response.statusCode;
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logger.i(
      '*** Error ***\nERROR[${err.response?.data?['code'] ?? err.response?.statusCode}] => ${err.requestOptions.uri} WITH RESPONSE: ${err.response?.data ?? ''}',
    );
    return super.onError(err, handler);
  }
}
