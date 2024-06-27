import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/utils/localization/string_hardcoded.dart';

import '../presentation/widgets/dialogs.dart';

extension AsyncValueUI on AsyncValue {
  Future<bool> showAlertDialogOnError(BuildContext context) async {
    if (!isRefreshing && hasError) {
      await showExceptionAlertDialog(
        context: context,
        title: 'エラー'.hc,
        exception: error,
      );
      return true;
    } else {
      return false;
    }
  }
}
