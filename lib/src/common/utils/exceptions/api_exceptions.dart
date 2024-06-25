import 'package:rem_admin/src/common/utils/contants/api.dart';
import 'app_exception.dart';

class ApiException extends AppException implements Exception {
  const ApiException({
    super.code,
    super.error,
    super.message,
    super.defaultMessage = serverConnectionFailure,
  });
}

class BadRequestException extends ApiException {
  const BadRequestException({super.error, super.message})
      : super(
          code: '400',
          defaultMessage: 'リクエストに問題があります。',
        );
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({super.error, super.message})
      : super(
          code: '401',
          defaultMessage: '認証されていません。',
        );
}

class ForbiddenException extends ApiException {
  const ForbiddenException({super.error, super.message})
      : super(
          code: '403',
          defaultMessage: '指定した操作を行う権限がありません。',
        );
}

class ApiNotFoundException extends ApiException {
  const ApiNotFoundException({super.error, super.message})
      : super(
          code: '404',
          defaultMessage: 'リクエストした API が見つかりませんでした。',
        );
}

class InternalServerErrorException extends ApiException {
  const InternalServerErrorException({super.error, super.message})
      : super(
          code: '500',
          defaultMessage: 'サーバーでエラーが発生しました。',
        );
}

class ApiTimeoutException extends ApiException {
  const ApiTimeoutException({super.error, super.message})
      : super(
          defaultMessage: 'API 通信がタイムアウトしました。'
              '通信環境をご確認のうえ、再度実行してください。',
        );
}

class NetworkNotConnectedException extends ApiException {
  const NetworkNotConnectedException({super.error, super.message})
      : super(
          defaultMessage: 'ネットワーク接続がありません。',
        );
}

class ServerConnectionFailureException extends ApiException {
  const ServerConnectionFailureException({super.error, super.message})
      : super(
          defaultMessage: serverConnectionFailure,
        );
}
