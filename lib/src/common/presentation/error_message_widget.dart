import 'package:flutter/material.dart';

import '../../common/presentation/context.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    this.errorMessage = 'エラーが発生しました',
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: context.textTheme.bodyMedium?.copyWith(color: Colors.red),
    );
  }
}
