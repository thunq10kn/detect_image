import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:rem_admin/src/common/data/response_result/response_result.dart';
import '../api_service/api_provider.dart';
import '../utils/logger.dart';
import '../utils/regexp.dart';
import 'api_client_mixin.dart';

// TODO: Create interceptors for authorization header, network connectivirity, redirect on 401, etc.

final httpClientProvider = Provider<http.Client>(
  (ref) => http.Client(),
);

final httpRetryClientProvider = Provider<RetryClient>((ref) {
  final client = ref.watch(httpClientProvider);
  const retries = 1;
  return RetryClient(
    client,
    retries: retries,
    when: ((response) =>
        response.statusCode == 503 || response.statusCode == 401),
    onRetry: (request, response, retryCount) async {
      logger.i(
        '${request.method} response: code = ${response?.statusCode}, '
        'length = ${response?.contentLength}',
      );
      if (response?.statusCode == 401) {
        logger.i(
          'Retry with refresh firebase auth idToken,',
          error: 'times from now = ${++retryCount} in $retries',
        );
      }
    },
  );
});

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient(ref));

class ApiClient with ApiClientMixin {
  const ApiClient(this.ref);

  final Ref ref;

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

  Future<Map<String, String>?> _headers(
      [bool forceRefresh = false,
      String contentType = "application/json; charset=UTF-8"]) async {
    const idToken = "ya29.a0AXooCgs83i2idAtK_z7_0k4WQLMeT-Deeeo-1qzvm22-kfH3gxqpgmGdLNaewLud5arYEKn-X-9wJOyoTu-RH2BjRAEVFGylQqPOZy3F8RJ8mBeJkQjFnDHTosDsWESUte8JA2y2aN3EToZSoM3GhaERsr-c6BgzIMK8hpRQuOdASTa1ygy5fqhs7RIY6962pdLmvPWKRoE-pnZxtdfdUZbcGPwD5ft40w9paDOpAsUem8n-7cUkAm4_7aYHOOTXwIUfJn0NhtYLIiZuJ2DmI8V5PF0fE_yYXX6o0QoBzr5f4ZdmMEwCB37T2T73w6LIUxXaZw_NoDt-PFx6MQB8nce8gfB-EcmkwKF_lKFyPWUix8RuPfqkB9mN9annde9-5vMe0QHjGF7mWuY5Om654k21j50aCgYKARQSARMSFQHGX2MiqqUirCcmEhrC-uuE44Mjcg0418";
    return <String, String>{
      if (idToken != null) "Authorization": "Bearer $idToken",
      'Content-Type': contentType,
    };
  }

  Future<ResponseResult> get(
    String path, {
    Map<String, String>? queryParameters,
    bool forceRefresh = false,
  }) async {
    try {
      final uri = _uri(path, queryParameters: queryParameters);
      logger.i('Get request: uri = $uri');
      final response = await ref.read(httpRetryClientProvider).get(
            uri,
            headers: await _headers(forceRefresh),
          );
      logger.i(
        'Get response: code = ${response.statusCode}, '
        'length = ${response.contentLength}, '
        'body = ${response.body}',
      );
      ref.read(httpStatusCodeProvider.notifier).state = response.statusCode;
      final baseResponseData = parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
    } on Exception catch (e) {
      return handleApiError(e);
    }
  }

  Future<ResponseResult> post(
    String path, {
    Map<String, dynamic>? data,
    bool forceRefresh = false,
    String contentType = "application/json; charset=UTF-8",
  }) async {
    try {
      final uri = _uri(path);
      logger.i('Post request: uri = $uri');
      final response = await ref.read(httpRetryClientProvider).post(
            uri,
            headers: await _headers(forceRefresh, contentType),
            body: data != null ? jsonEncode(data) : null,
          );
      logger.i(
        'Post response: code = ${response.statusCode}, '
        'length = ${response.contentLength}, '
        'body = ${response.body}',
      );
      ref.read(httpStatusCodeProvider.notifier).state = response.statusCode;
      final baseResponseData = parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
    } on Exception catch (e) {
      return handleApiError(e);
    }
  }

  Future<ResponseResult> put(
    String path, {
    Map<String, dynamic>? data,
    bool forceRefresh = false,
  }) async {
    try {
      final uri = _uri(path);
      logger.i('PUT request: uri = $uri');
      logger.i('PUT request: body = ${jsonEncode(data)}');
      logger.i('PUT request: _headers = ${_headers(forceRefresh)}');
      final response = await ref.read(httpRetryClientProvider).put(
            uri,
            headers: await _headers(forceRefresh),
            body: data != null ? jsonEncode(data) : null,
          );

      logger.i(
        'PUT response: code = ${response.statusCode}, '
        'length = ${response.contentLength}, '
        'body = ${response.body}',
      );
      ref.read(httpStatusCodeProvider.notifier).state = response.statusCode;
      final baseResponseData = parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
    } on Exception catch (e) {
      return handleApiError(e);
    }
  }

  Future<ResponseResult> delete(
    String path, {
    Map<String, dynamic>? data,
    bool forceRefresh = false,
  }) async {
    try {
      final uri = _uri(path);
      logger.i('Delete request: uri = $uri');
      final response = await ref.read(httpRetryClientProvider).delete(
            uri,
            headers: await _headers(forceRefresh),
            body: data != null ? jsonEncode(data) : null,
          );
      logger.i(
        'Delete response: code = ${response.statusCode}, '
        'length = ${response.contentLength}, '
        'body = ${response.body}',
      );
      ref.read(httpStatusCodeProvider.notifier).state = response.statusCode;
      final baseResponseData = parseResponse(response);
      return ResponseResult.success(data: baseResponseData);
    } on Exception catch (e) {
      return handleApiError(e);
    }
  }
}

final httpStatusCodeProvider = StateProvider<int?>((ref) => null);
