import 'package:rem_admin/src/common/exceptions/app_exception.dart';
import 'package:rem_admin/src/common/i18n/strings.g.dart';
import 'package:rem_admin/src/common/router/app_router.dart';
import 'package:flutter/foundation.dart';

/// Object
extension ObjectEx on Object {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  /// Return error message for display
  String get errorMessage {
    if (this is AppException) {
      final error = this as AppException;
      return error.displayMessage;
    }
    if (this is Exception && noRouteExceptionRegex.hasMatch(toString())) {
      return t.errorScreen.notFound404;
    }
    return kReleaseMode ? t.errorScreen.unknownErrorOccurred : toString();
  }
}
