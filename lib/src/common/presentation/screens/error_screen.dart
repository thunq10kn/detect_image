import 'package:rem_admin/src/common/i18n/strings.g.dart';
import 'package:rem_admin/src/common/presentation/error_message.dart';
import 'package:rem_admin/src/common/presentation/widgets/empty_placeholder.dart';
import 'package:rem_admin/src/common/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Error screen used when any widget in the app fails to build
class ErrorScreen extends HookConsumerWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(errorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.errorScreen.error),
      ),
      body: SingleChildScrollView(
        child: EmptyPlaceholder(
          message: error?.errorMessage ?? t.errorScreen.unknownErrorOccurred,
        ),
      ),
    );
  }
}
