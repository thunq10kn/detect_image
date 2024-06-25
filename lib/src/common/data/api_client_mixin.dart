import 'dart:convert';
import 'dart:io';

import 'package:rem_admin/src/common/data/base_response_data/base_response_data.dart';
import 'package:rem_admin/src/common/utils/contants/api.dart';
import 'package:rem_admin/src/common/utils/exceptions/api_exceptions.dart';
import 'package:rem_admin/src/common/utils/localization/string_hardcoded.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'response_result/response_result.dart';

mixin ApiClientMixin {
  BaseResponseData parseResponse(http.Response response) {
    final statusCode = response.statusCode;
    final data = json.decode(response.body) as Map<String, dynamic>;
    final baseResponseData = BaseResponseData.fromDynamic(data);
    _validateResponse(
      statusCode: statusCode,
      data: baseResponseData,
    );
    return baseResponseData;
  }

  void _validateResponse({
    required int? statusCode,
    required BaseResponseData data,
  }) {
    final message = data.message;
    final error = data.error;
    if (statusCode == 400) {
      throw BadRequestException(
        message: message,
        error: error,
      );
    }
    if (statusCode == 401) {
      throw UnauthorizedException(
        message: message,
        error: error,
      );
    }
    if (statusCode == 403) {
      throw ForbiddenException(
        message: message,
        error: error,
      );
    }
    if (statusCode == 404) {
      throw ApiNotFoundException(
        message: message,
        error: error,
      );
    }
    if (statusCode == 500) {
      throw InternalServerErrorException(
        message: message,
        error: error,
      );
    }
    if ((statusCode ?? 400) >= 400) {
      throw ApiException(message: message);
    }
  }

  ResponseResult handleApiError(Exception e) {
    if (e is ClientException) {
      final exception = _handleClientException(e);
      return ResponseResult.failure(message: exception.toString());
    } else if (e is ApiException) {
      return ResponseResult.failure(message: e.toString());
    } else if (e is SocketException) {
      return const ResponseResult.failure(message: networkNotConnected);
    } else if (e is FormatException) {
      return const ResponseResult.failure(message: responseFormatNotValid);
    } else {
      return ResponseResult.failure(message: e.toString());
    }
  }

  Exception _handleClientException(ClientException e) {
    if (e.message == 'XMLHttpRequest error.'.hc) {
      return const ServerConnectionFailureException();
    }
    return const ApiException();
  }
}
