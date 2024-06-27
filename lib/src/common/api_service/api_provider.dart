import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/presentation/widgets/dialogs.dart';

import '../presentation/app_func.dart';
import '../presentation/app_loading.dart';
import '../utils/env.dart';
import '../utils/logger_func.dart';
import '../utils/regexp.dart';
import 'base_api_error.dart';
import 'base_result_model.dart';
import 'custom_exception.dart';
import 'dio_curl_interceptor.dart';
import 'intercepter_logging.dart';

String get baseUrl {
  switch (Env.flavor) {
    case Flavor.dev:
      return 'https://vision.googleapis.com/v1/';
    case Flavor.stg:
      return 'https://vision.googleapis.com/v1/';
    case Flavor.prod:
      return 'https://vision.googleapis.com/v1/';
  }
}

String get baseUrlOCR {
  switch (Env.flavor) {
    case Flavor.dev:
      return 'https://text-reconize.domainfortesting.click/';
    case Flavor.stg:
      return 'https://text-reconize.domainfortesting.click/';
    case Flavor.prod:
      return 'https://text-reconize.domainfortesting.click/';
  }
}

abstract class ApiProviderRepository {
  Future<Response<T>> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> postRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> postFormDataRequest<T>(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> putRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> deleteRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> patchRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  });
}

final apiProviderRepositoryImplProvider = Provider<ApiProviderRepositoryImpl>(
    (ref) => ApiProviderRepositoryImpl(ref));

class ApiProviderRepositoryImpl implements ApiProviderRepository {
  const ApiProviderRepositoryImpl(this.ref);

  final Ref ref;

  Future<Dio> get _dio async {
    const idToken =
        "ya29.a0AXooCgs83i2idAtK_z7_0k4WQLMeT-Deeeo-1qzvm22-kfH3gxqpgmGdLNaewLud5arYEKn-X-9wJOyoTu-RH2BjRAEVFGylQqPOZy3F8RJ8mBeJkQjFnDHTosDsWESUte8JA2y2aN3EToZSoM3GhaERsr-c6BgzIMK8hpRQuOdASTa1ygy5fqhs7RIY6962pdLmvPWKRoE-pnZxtdfdUZbcGPwD5ft40w9paDOpAsUem8n-7cUkAm4_7aYHOOTXwIUfJn0NhtYLIiZuJ2DmI8V5PF0fE_yYXX6o0QoBzr5f4ZdmMEwCB37T2T73w6LIUxXaZw_NoDt-PFx6MQB8nce8gfB-EcmkwKF_lKFyPWUix8RuPfqkB9mN9annde9-5vMe0QHjGF7mWuY5Om654k21j50aCgYKARQSARMSFQHGX2MiqqUirCcmEhrC-uuE44Mjcg0418";
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 45000),
          receiveTimeout: const Duration(seconds: 30000),
          responseType: ResponseType.json,
          headers: {
            'Authorization': 'Bearer $idToken',
            "Accept": "application/json",
            "x-goog-user-project": "detect-image-427504",
            "Content-Type": "application/json; charset=utf-8"
            // 'access_token': apiAccessToken,
          }),
    )..interceptors.addAll([
        AppInterceptorLogging(),
        DioCurlInterceptor(),
      ]);
    return dio;
  }

  Future<Dio> getDio(String idToken) async {
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 45000),
          receiveTimeout: const Duration(seconds: 30000),
          responseType: ResponseType.json,
          headers: {
            'Authorization': 'Bearer $idToken',
            "Accept": "application/json",
            "x-goog-user-project": "detect-image-427504",
            "Content-Type": "application/json; charset=utf-8"
            // 'access_token': apiAccessToken,
          }),
    )..interceptors.addAll([
        AppInterceptorLogging(),
        DioCurlInterceptor(),
      ]);
    return dio;
  }

  Future<Dio> getDioOCR() async {
    final dio = Dio(
      BaseOptions(
          baseUrl: baseUrlOCR,
          connectTimeout: const Duration(seconds: 45000),
          receiveTimeout: const Duration(seconds: 30000),
          responseType: ResponseType.json,
          headers: {
            "Accept": "application/json",
            "Content-Type": "multipart/form-data",
            // 'access_token': apiAccessToken,
          }),
    )..interceptors.addAll([
      AppInterceptorLogging(),
      DioCurlInterceptor(),
    ]);
    return dio;
  }

  Uri _uri(
    String path, {
    Map<String, String>? queryParameters,
  }) {
    final matches = uriRegexp.allMatches(baseUrl);
    if (matches.length != 1) throw Exception('baseUrl is invalid.');
    final match = matches.first;

    return Uri(
      scheme: match.namedGroup('schema'),
      host: match.namedGroup('host'),
      port: int.tryParse(match.namedGroup('port') ?? ''),
      path: path,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response<T>> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
    bool isException = false,
  }) async {
    try {
      final dio = await _dio;
      final Response<T> response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options, //buildOptions(options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      if (isException) {
        return _catchException(e);
      }
      rethrow;
    }
  }

  @override
  Future<Response<T>> postRequest<T>(
    String path, {
    dynamic data,
    String idToken = "",
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
    bool isException = false,
  }) async {
    try {
      final dio = await getDio(idToken);
      final Response<T> response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        //buildOptions(options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      if (isException) {
        return _catchException(e);
      }
      rethrow;
    }
  }

  @override
  Future<Response<T>> patchRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
    bool isException = false,
  }) async {
    try {
      final dio = await _dio;
      final Response<T> response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        //buildOptions(options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      if (isException) {
        return _catchException(e);
      }
      rethrow;
    }
  }

  @override
  Future<Response<T>> deleteRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool ignoreInvalidToken = false,
    bool isException = false,
  }) async {
    try {
      final dio = await _dio;
      final Response<T> response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options, //buildOptions(options),
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      if (isException) {
        return _catchException(e);
      }
      rethrow;
    }
  }

  @override
  Future<Response<T>> putRequest<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
    bool isException = false,
  }) async {
    try {
      final dio = await _dio;
      final Response<T> response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        //buildOptions(options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      if (isException) {
        return _catchException(e);
      }
      rethrow;
    }
  }

  @override
  Future<Response<T>> postFormDataRequest<T>(String path,
      {FormData? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool ignoreInvalidToken = false}) async {
    try {
      final dio = await getDioOCR();
      final Response<T> response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        //buildOptions(options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioException catch (e) {
      return _catchException(e);
    }
  }

  dynamic getSE(DioException e) {
    if (e.error is SocketException) {
      final errorT = e.error as SocketException;
      if (errorT.osError?.errorCode == 101) {
        return BaseResultModel(
          statusCode: 101,
          message:
              'An error occurred, please check the connection and try again!',
        ).toJson();
      }
    } else if (e.type == DioErrorType.connectionTimeout) {
      return BaseResultModel(
        statusCode: 102,
        message:
            'An error occurred, please check the connection and try again!',
      ).toJson();
    }
    return null;
  }

  dynamic getError() {
    return BaseResultModel(
      statusCode: 101,
      message: 'An error occurred, please try again!',
    ).toJson();
  }

  Response<T> _catchException<T>(DioException dioError) {
    bool isShowError = false;
    Logger.debug('_catchException $dioError');
    try {
      final se = getSE(dioError);
      if (se != null) {
        return Response(data: se, requestOptions: RequestOptions(path: ''));
      }
    } catch (e) {
      Logger.error("ERROR EXCEPTION = ${e.toString()}");
    }
    switch (dioError.type) {
      case DioExceptionType.receiveTimeout:
        AppFunc.showAlertDialog(ref.watch(navigatorKeyProvider).currentContext!,
            message: 'リクエストタイムアウト');
        throw FetchDataException('receiveTimeout');
      case DioExceptionType.badResponse:
        try {
          if (dioError.response?.statusCode == 400) {
            final validMap =
                json.decode(json.encode(dioError.response?.data ?? ''))
                    as Map<String, dynamic>;
            try {
              BaseApiError error = BaseApiError.fromJson(validMap);
              if (error.message is List) {
                if (!isShowError) {
                  isShowError = true;
                  AppFunc.showAlertDialog(
                      ref.watch(navigatorKeyProvider).currentContext!,
                      message: error.message?.map((e) => e).join('\n'));
                }
              } else {
                if (!isShowError) {
                  isShowError = true;
                  AppFunc.showAlertDialog(
                      ref.watch(navigatorKeyProvider).currentContext!,
                      message: error.message);
                }
              }
            } catch (e) {
              BaseResultModel error = BaseResultModel.fromJson(validMap);
              if (!isShowError) {
                isShowError = true;
                AppFunc.showAlertDialog(
                    ref.watch(navigatorKeyProvider).currentContext!,
                    message: error.message);
              }
            }
          } else if (dioError.response?.statusCode == 401) {
            hideLoading();
            // SessionManager().isExpired = true;
            // AppFunc.showPopupConfirm(
            //     context: GetX.Get.context!,
            //     message: 'セッションの有効期限が切れました。\n続行するには、
            //     もう一度ログインしてください。',
            //     leftAction: () async {
            //       await FitbitHelper().unauthorize();
            //       await Purchases.logOut();
            //       LocalStorageHelper.logout().then((value) {
            //         Navigator.pop(GetX.Get.context!);
            //         SubscriptionManager().setActive(false);
            //         AvatarHelper().saveAvatar('');
            //         SessionManager().isExpired = false;
            //         AvatarHelper().resetOptionsSelected();
            //         GetX.Get.offAllNamed(Routes.LOGIN);
            //       });
            //     },
            //     leftTitle: "同意",
            //     isConfirm: false);
          } else if (dioError.response?.statusCode == 429) {
            hideLoading();
          } else {
            final validMap =
                dioError.response?.data ?? '' as Map<String, dynamic>;
            BaseResultModel error = BaseResultModel.fromJson(validMap);
            AppFunc.showAlertDialog(
                ref.watch(navigatorKeyProvider).currentContext!,
                message: error.message);
          }
          return dioError.response as Response<T>;
        } catch (e) {
          if (e is List<String>) {
            AppFunc.showAlertDialog(
                ref.watch(navigatorKeyProvider).currentContext!,
                message: e.map((e) => e).join('\n'));
          }
          Logger.error(e.toString());
        }
        return Response(
            data: getError(), requestOptions: RequestOptions(path: ''));
      default:
        return Response(
            data: getError(), requestOptions: RequestOptions(path: ''));
    }
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
