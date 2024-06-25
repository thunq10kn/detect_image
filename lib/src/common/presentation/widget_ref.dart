import 'package:rem_admin/src/common/i18n/strings.g.dart';
import 'package:rem_admin/src/common/presentation/error_message.dart';
import 'package:rem_admin/src/common/presentation/scaffold_messenger.dart';
import 'package:rem_admin/src/common/presentation/widgets/dialogs.dart';
import 'package:rem_admin/src/common/presentation/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension WidgetRefEx on WidgetRef {
  void listenResult<T>(
    ProviderListenable<AsyncValue<T>> resultProvider, {
    void Function(T data)? complete,
    void Function()? fail,
    bool loading = true,
    String? completeMessage,
  }) {
    listen<AsyncValue<T>>(
      resultProvider,
      (previous, next) async {
        if (next.isLoading) {
          // In process
          if (loading) {
            read(overlayLoadingProvider.notifier).state = true;
          }
          return;
        }
        await next.when(
          data: (data) async {
            // Processing Completed
            read(overlayLoadingProvider.notifier).state = false;
            if (completeMessage != null) {
              // Show SnackBar if there is a completion message.
              final messengerState =
                  read(scaffoldMessengerKeyProvider).currentState;
              messengerState?.showSnackBar(
                SnackBar(
                  content: Text(completeMessage),
                ),
              );
            }
            complete?.call(data);
          },
          error: (e, s) async {
            // Error occurred
            read(overlayLoadingProvider.notifier).state = false;
            await showAlertDialog(
              context: read(navigatorKeyProvider).currentContext!,
              title: t.dialogs.error,
              content: e.errorMessage,
            );
            fail?.call();
          },
          loading: () {
            // Processing
            if (loading) {
              read(overlayLoadingProvider.notifier).state = true;
            }
          },
        );
      },
    );
  }
}
