abstract class AppException implements Exception {
  const AppException(
    this.message,
    this.displayMessage,
  );

  final Object message;
  final String displayMessage;
}

/// Network exceptions
class NetworkException extends AppException {
  const NetworkException._([
    super.message = 'network exception',
    super.displayMessage = 'ネットワーク関連のエラーが発生しました。',
    NetworkExceptionCode? code,
  ]) : code = code ?? NetworkExceptionCode.unknown;

  /// 1. 無効なJSONを送信すると、`400 Bad Request` レスポンスが返されます。
  /// 2. 間違ったタイプの JSON 値を送信すると、`400 Bad Request` レスポンスが返されます。
  factory NetworkException.badRequest() => const NetworkException._(
        'Illegal request sent. (400)',
        '不正なリクエストが送信されました。',
        NetworkExceptionCode.badRequest,
      );

  /// 無効な認証情報で認証すると、`401 Unauthorized` が返されます。
  factory NetworkException.unauthorized() => const NetworkException._(
        'Illegal request sent. (401)',
        '認証されていません。\nログインしてください。',
        NetworkExceptionCode.badCredentials,
      );

  /// API は、無効な認証情報を含むリクエストを短期間に複数回検出すると、`403 Forbidden` で、
  /// そのユーザーに対するすべての認証試行（有効な認証情報を含む）を一時的に拒否します。
  factory NetworkException.forbidden() => const NetworkException._(
        'Please wait a while and try again. (403)',
        '指定した操作を行う権限がありません。',
        NetworkExceptionCode.maximumNumberOfLoginAttemptsExceeded,
      );

  /// `404 Not Found`
  factory NetworkException.notFound() => const NetworkException._(
        'No data found. (404)',
        'データが見つかりませんでした。',
        NetworkExceptionCode.notFound,
      );

  /// `409 Conflict`
  factory NetworkException.conflict() => const NetworkException._(
        'The data already exists. (409)',
        '既にデータが存在しています。',
        NetworkExceptionCode.notFound,
      );

  /// 無効なフィールドを送信すると、`422 Unprocessable Entity` レスポンスが返されます。
  factory NetworkException.validationFailed() => const NetworkException._(
        'Illegal request sent. (422)',
        '無効なフィールドが含まれています。',
        NetworkExceptionCode.validationFailed,
      );

  /// `429 Too Many Requests`
  factory NetworkException.tooManyRequests() => const NetworkException._(
        'Illegal too many requests. (429)',
        'アクセスが超過しました。\nしばらく時間をおいてから再度お試しください。',
        NetworkExceptionCode.validationFailed,
      );

  /// クライアントがリクエストの呼び出しをキャンセルしたときに `499 Client Closed Request`レスポンスが返されます。
  factory NetworkException.cancelled() => const NetworkException._(
        'Request has been canceled. (499)',
        'リクエストがキャンセルされました。',
        NetworkExceptionCode.notFound,
      );

  /// `500 Internal Server Error` サーバーの内部エラー
  factory NetworkException.internalServerError() => const NetworkException._(
        'Internal Server Error. (500)',
        'サーバーでエラーが発生しました。',
        NetworkExceptionCode.serviceUnavailable,
      );

  /// `501 Not Implemented` 実装されていない
  factory NetworkException.notImplemented() => const NetworkException._(
        'Not Implemented. (501)',
        'サービスが停止中です。\nしばらく時間をおいてから再度お試しください。',
        NetworkExceptionCode.serviceUnavailable,
      );

  /// `503 Service Unavailable` サービス停止中
  factory NetworkException.serviceUnavailable() => const NetworkException._(
        'Please wait a while and try again. (503)',
        'サービスが停止中です。\nしばらく時間をおいてから再度お試しください。',
        NetworkExceptionCode.serviceUnavailable,
      );

  /// `504 Gateway Timeout` タイムアウト
  factory NetworkException.timeout() => const NetworkException._(
        'Request timed out. (504)',
        'リクエストがタイムアウトしました。\n通信環境をご確認のうえ、再度お試しください。',
        NetworkExceptionCode.serviceUnavailable,
      );

  /// インターネット接続不可
  factory NetworkException.noInternetConnection() => const NetworkException._(
        'Please try again in a good communication environment. (-2)',
        'ネットワーク接続がありません。\n通信環境をご確認のうえ、再度お試しください。',
        NetworkExceptionCode.noInternetConnection,
      );

  /// 不明なエラー
  factory NetworkException.unknown() => const NetworkException._(
        'An unknown error has occurred. (-1)',
        '不明なエラーが発生しました。',
        NetworkExceptionCode.unknown,
      );

  /// エラーコード
  final NetworkExceptionCode code;

  @override
  String toString() => 'NetworkException[${code.name}]: $message';
}

/// Error codes for network-related exceptions
enum NetworkExceptionCode {
  /// 不正なリクエスト
  badRequest,

  /// 不正な認証情報
  badCredentials,

  /// 短期間に無効な認証情報を受け取った
  maximumNumberOfLoginAttemptsExceeded,

  /// データが見つからない
  notFound,

  /// 無効なフィールドが見つかった
  validationFailed,

  /// サービス停止中
  serviceUnavailable,

  /// インターネット接続不可
  noInternetConnection,

  /// 不明なエラー
  unknown,
  ;
}

/// Auth exceptions
class AuthException extends AppException {
  const AuthException._([
    super.message = 'auth exception',
    super.displayMessage = '認証関連のエラーが発生しました。',
    AuthExceptionCode? code,
  ]) : code = code ?? AuthExceptionCode.unknown;

  factory AuthException.captchaCheckFailed() => const AuthException._(
        'Indicates the reCAPTCHA response token was invalid, expired, '
            'or if this method was called from a non-whitelisted domain',
        'reCAPTCHA に失敗しました。',
        AuthExceptionCode.captchaCheckFailed,
      );
  factory AuthException.invalidPhoneNumber() => const AuthException._(
        'Indicates the phone number has an invalid format',
        '電話番号を正しい形式で入力してください。',
        AuthExceptionCode.invalidPhoneNumber,
      );
  factory AuthException.missingPhoneNumber() => const AuthException._(
        'Indicates the phone number is missing',
        '電話番号を正しい形式で入力してください。',
        AuthExceptionCode.missingPhoneNumber,
      );
  factory AuthException.invalidVerificationCode() => const AuthException._(
        'Indicates the verification code has an invalid format',
        'コードが誤っています。再度ご確認ください。',
        AuthExceptionCode.invalidVerificationCode,
      );
  factory AuthException.missingVerificationCode() => const AuthException._(
        'Indicates the verification code is missing',
        'コードが誤っています。再度ご確認ください。',
        AuthExceptionCode.missingVerificationCode,
      );
  factory AuthException.quotaExceeded() => const AuthException._(
        'Indicates the SMS quota for the Firebase project has been exceeded',
        'アクセスが超過しました。\nしばらく時間をおいてから再度お試しください。',
        AuthExceptionCode.quotaExceeded,
      );
  factory AuthException.invalidEmail() => const AuthException._(
        'Indicates the email is invalid',
        'メールアドレスを正しい形式で入力してください。',
        AuthExceptionCode.invalidEmail,
      );
  factory AuthException.emailNotExist() => const AuthException._(
        'The email address you entered does not exist. Please check again.',
        '入力されたメールアドレスは存在しません。もう一度ご確認をお願いいたします。',
        AuthExceptionCode.invalidEmail,
      );
  factory AuthException.wrongPassword() => const AuthException._(
        'Indicates the user attempted sign in with a wrong password',
        'パスワードが間違っています。',
        AuthExceptionCode.wrongPassword,
      );
  factory AuthException.weakPassword() => const AuthException._(
        'Indicates an attempt to set a password that is considered too weak',
        'パスワードは6文字以上にしてください。',
        AuthExceptionCode.weakPassword,
      );
  factory AuthException.userNotFound() => const AuthException._(
        'Indicates the user account was not found',
        'アカウントが見つかりません。',
        AuthExceptionCode.userNotFound,
      );
  factory AuthException.userDisabled() => const AuthException._(
        'Indicates the user\'s account is disabled on the server.',
        '無効なアカウントです。',
        AuthExceptionCode.userDisabled,
      );
  factory AuthException.tooManyRequests() => const AuthException._(
        'Indicates that too many requests were made to a server method',
        'アクセスが超過しました。\nしばらく時間をおいてから再度お試しください。',
        AuthExceptionCode.tooManyRequests,
      );
  factory AuthException.operationNotAllowed() => const AuthException._(
        'Indicates the administrator disabled sign in with the '
            'specified identity provider',
        'ログインが許可されていません。管理者にご連絡ください。',
        AuthExceptionCode.operationNotAllowed,
      );
  factory AuthException.networkRequestFailed() => const AuthException._(
        'Indicates a network error occurred (such as a timeout, '
            'interrupted connection, or unreachable host).',
        'タイムアウトしました。',
        AuthExceptionCode.networkRequestFailed,
      );
  factory AuthException.emailAlreadyInUse() => const AuthException._(
        'Indicates the email used to attempt a sign up is already in use.',
        '既に使われているメールアドレスです。',
        AuthExceptionCode.emailAlreadyInUse,
      );
  factory AuthException.userMismatch() => const AuthException._(
        'Indicates that an attempt was made to reauthenticate '
            'with a user which is not the current user',
        '異なるメールアドレスでログインしようとしています。',
        AuthExceptionCode.userMismatch,
      );
  factory AuthException.invalidActionCode() => const AuthException._(
        'The provided email is already in use by an existing user. '
            'Each user must have a unique email.',
        '無効なログインリンクです。ログインリンクが正しいかご確認ください。',
        AuthExceptionCode.invalidActionCode,
      );
  factory AuthException.notVerifiedEmail() => const AuthException._(
        'Not verified email.',
        '認証が完了していません。メールをご確認ください。',
        AuthExceptionCode.notVerifiedEmail,
      );
  factory AuthException.requiresRecentLogin() => const AuthException._(
        'Indicates the user has attempted to change email or password '
            'more than 5 minutes after signing in',
        'ログインし直してから再度お試し下さい。',
        AuthExceptionCode.requiresRecentLogin,
      );
  factory AuthException.invalidCredential() => const AuthException._(
        'Indicates the supplied auth credential is invalid.',
        'メールアドレスまたはパスワードが間違っています。',
        AuthExceptionCode.invalidCredential,
      );
  factory AuthException.missingConfirmationResult() => const AuthException._(
        'Indicates The ConfirmationResult is missing.',
        'SMSを再送信してから、再度コードをご入力ください。',
        AuthExceptionCode.invalidCredential,
      );
  factory AuthException.appUserNotLoggedIn() => const AuthException._(
        'Indicates The AppUser is missing.',
        'もう一度ログインしてください。',
        AuthExceptionCode.invalidCredential,
      );

  factory AuthException.accountIsDisable() => const AuthException._(
        'Account has been disabled',
        'アカウントが無効になりました。',
        AuthExceptionCode.accountIsDisable,
      );

  /// 不明なエラー
  factory AuthException.unknown() => const AuthException._(
        'An unknown error has occurred.',
        'エラーが発生しました。',
        AuthExceptionCode.unknown,
      );

  /// エラーコード
  final AuthExceptionCode code;

  @override
  String toString() => 'AuthException[${code.name}]: $message';
}

/// Error codes for authentication-related exceptions
enum AuthExceptionCode {
  /// reCAPTCHA に失敗
  captchaCheckFailed,

  /// 不正な電話番号
  invalidPhoneNumber,

  /// 電話番号が未指定
  missingPhoneNumber,

  /// 不正な検証コード
  invalidVerificationCode,

  /// コードが未指定
  missingVerificationCode,

  /// Firebase プロジェクトの SMS クォータを超えた
  quotaExceeded,

  /// 不正なメールアドレス
  invalidEmail,

  /// パスワード誤り
  wrongPassword,

  /// パスワードが弱い
  weakPassword,

  /// ユーザーが見つからない
  userNotFound,

  /// ユーザーが無効
  userDisabled,

  /// 短期間に大量のアクセス拒否
  tooManyRequests,

  /// 無効な操作
  operationNotAllowed,

  /// ネットワーク不正
  networkRequestFailed,

  /// 既に使われているメールアドレス
  emailAlreadyInUse,

  /// 異なるユーザーで再認証が実施された
  userMismatch,

  /// アクションコードが不正
  invalidActionCode,

  /// メールアドレスが確認されていない
  notVerifiedEmail,

  /// 最近ログイン済み
  requiresRecentLogin,

  /// 不正な認証情報
  invalidCredential,

  /// アプリにログイン
  appUserNotLoggedIn,

  accountIsDisable,

  /// 不明なエラー
  unknown,
  ;
}

/// UrlLauncher exceptions
class UrlLauncherException extends AppException {
  const UrlLauncherException._([
    super.message = 'UrlLauncher Exception',
    super.displayMessage = 'ページ遷移関連のエラーが発生しました。',
    UrlLauncherExceptionCode? code,
  ]) : code = code ?? UrlLauncherExceptionCode.unknown;

  factory UrlLauncherException.failedLaunchUrl() =>
      const UrlLauncherException._(
        'failed to launch URL.',
        'ページの遷移に失敗しました。',
        UrlLauncherExceptionCode.failedLaunchUrl,
      );
  factory UrlLauncherException.cannotParseUrl() => const UrlLauncherException._(
        'cannot parse URL.',
        'URL の解析に失敗しました。',
        UrlLauncherExceptionCode.cannotParseUrl,
      );

  /// エラーコード
  final UrlLauncherExceptionCode code;

  @override
  String toString() => 'UrlLauncherException: $message, '
      'code = ${code.name}';
}

/// 画像取得例外のエラーコード
enum UrlLauncherExceptionCode {
  failedLaunchUrl,
  cannotParseUrl,
  unknown,
  ;
}

/// ImagePicker exceptions
class ImagePickerException extends AppException {
  const ImagePickerException._([
    super.message = 'ImagePicker Exception',
    super.displayMessage = '画像取得時にエラーが発生しました。',
    ImagePickerExceptionCode? code,
  ]) : code = code ?? ImagePickerExceptionCode.unknown;

  factory ImagePickerException.failedCamera() => const ImagePickerException._(
        'Failed to retrieve image from the camera.',
        'カメラからの画像の取得に失敗しました。',
        ImagePickerExceptionCode.failedCamera,
      );
  factory ImagePickerException.failedGallery() => const ImagePickerException._(
        'Failed to retrieve image from the gallery.',
        'ギャラリーからの画像の取得に失敗しました。',
        ImagePickerExceptionCode.failedGallery,
      );
  factory ImagePickerException.failedCrop() => const ImagePickerException._(
        'Failed to crop image.',
        '画像のトリミングに失敗しました。',
        ImagePickerExceptionCode.failedCrop,
      );
  factory ImagePickerException.unknown() => const ImagePickerException._(
        'An unknown error related to image retrieval occurred.',
        '画像取得時にエラーが発生しました。',
        ImagePickerExceptionCode.unknown,
      );

  /// エラーコード
  final ImagePickerExceptionCode code;

  @override
  String toString() => 'ImagePickerException: $message, '
      'code = ${code.name}';
}

/// 画像取得例外のエラーコード
enum ImagePickerExceptionCode {
  failedCamera,
  failedGallery,
  failedCrop,
  unknown,
  ;
}

/// RealException exceptions
class RealException extends AppException {
  const RealException._([
    super.message = 'network exception',
    super.displayMessage = 'ネットワーク関連のエラーが発生しました。',
    RealExceptionCode? code,
  ]) : code = code ?? RealExceptionCode.unknown;

  /// 1. 無効なJSONを送信すると、`400 Bad Request` レスポンスが返されます。
  /// 2. 間違ったタイプの JSON 値を送信すると、`400 Bad Request` レスポンスが返されます。
  factory RealException.limitPublish() => const RealException._(
        'Limit publish real estate ',
        '物件数が制限を超えているため、ステータスを公開に変更できません。より多くの物件を公開したい場合、プランをアップグレードしてください。',
        RealExceptionCode.limitPublish,
      );

  factory RealException.validatePrice() => const RealException._(
        'The maximum property price must be greater than the minimum property price!',
        '最高物件価格は最低物件価格より大きくなければなりません！',
        RealExceptionCode.validatePrice,
      );

  factory RealException.emptyPrice() => const RealException._(
        'Please enter the property price!',
        '物件価格を入力してください!',
        RealExceptionCode.emptyPrice,
      );

  /// 不明なエラー
  factory RealException.unknown() => const RealException._(
        'An unknown error has occurred. (-1)',
        '不明なエラーが発生しました。',
        RealExceptionCode.unknown,
      );

  /// エラーコード
  final RealExceptionCode code;

  @override
  String toString() => 'RealException[${code.name}]: $message';
}

/// Error codes for network-related exceptions
enum RealExceptionCode {
  /// 不正なリクエスト
  limitPublish,
  validatePrice,
  emptyPrice,

  /// 不明なエラー
  unknown,
  ;
}
