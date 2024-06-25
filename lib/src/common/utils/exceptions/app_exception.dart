class AppException implements Exception {
  const AppException({
    this.code,
    this.error,
    this.message,
    this.defaultMessage = 'エラーが発生しました。',
  });

  /// A string to identify the error type such as status code or unique error code
  final String? code;

  /// A string describing the status code
  final String? error;

  /// A message describing the content of the exception
  final String? message;

  /// the message to use if message is empty
  final String defaultMessage;

  @override
  String toString() {
    if (code == null) {
      return (message ?? '').isEmpty ? defaultMessage : message!;
    }
    return '[$code] ${(message ?? '').isEmpty ? defaultMessage : message}';
  }
}
