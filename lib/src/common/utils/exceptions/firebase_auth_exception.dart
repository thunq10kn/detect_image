import 'package:rem_admin/src/common/utils/localization/string_hardcoded.dart';

import 'app_exception.dart';

enum FAExceptionCode {
  userDisabled,
  userNotFound,
  wrongPassword,
  tooManyRequests,
  weakPassword,
  emailAlreadyInUse,
  unexpectedFAError,
  ;

  String message(String? additionalErrorCode) {
    switch (this) {
      case FAExceptionCode.userDisabled:
        return 'そのアカウントはご使用になれません。'.hc;
      case FAExceptionCode.userNotFound:
        return '入力されたメールアドレスのユーザーは見つかりません。'.hc;
      case FAExceptionCode.wrongPassword:
        return 'パスワードが正しくありません。'.hc;
      case FAExceptionCode.tooManyRequests:
        return '認証失敗の回数が一定を超えました。'
                'しばらくして再度サインインしてください。'
            .hc;
      case FAExceptionCode.weakPassword:
        return 'パスワードが簡単です。'.hc;
      case FAExceptionCode.emailAlreadyInUse:
        return '入力されたメールアドレスのユーザーは既に使用されています。'.hc;
      case FAExceptionCode.unexpectedFAError:
        return '予期しないエラーが発生しました。スクショを撮影いただきお問い合わせください。[${additionalErrorCode ?? 'none'}]'
            .hc;
    }
  }
}

// Exception class for Firebase Auth
class FAException extends AppException implements Exception {
  FAException(
    FAExceptionCode subscribeExceptionCode, {
    String? additionalErrorCode,
  }) : super(
          code: subscribeExceptionCode.toString(),
          message: subscribeExceptionCode.message(additionalErrorCode),
          defaultMessage: '予期しないエラーが発生しました。'.hc,
        );

  factory FAException.fromFirebaseAuthException(
    String code, {
    String? additionalCode,
  }) {
    switch (code) {
      case 'user-disabled':
        return FAException(FAExceptionCode.userDisabled);
      case 'user-not-found':
        return FAException(FAExceptionCode.userNotFound);
      case 'wrong-password':
        return FAException(FAExceptionCode.wrongPassword);
      case 'too-many-requests':
        return FAException(FAExceptionCode.tooManyRequests);
      case 'weak-password':
        return FAException(FAExceptionCode.weakPassword);
      case 'email-already-in-use':
        return FAException(FAExceptionCode.emailAlreadyInUse);
      default:
        return FAException(
          FAExceptionCode.unexpectedFAError,
          additionalErrorCode: 'FA$additionalCode',
        );
    }
  }
}
