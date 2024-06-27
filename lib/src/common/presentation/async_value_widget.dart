import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'error_message_widget.dart';

/// Widget to handle async GET processing.
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    this.loadingWidth,
    this.loadingHeight,
    this.loading,
    this.error,
    this.isLoading,
    this.skipLoadingOnReload = false,
    this.skipLoadingOnRefresh = true,
    this.skipError = false,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final double? loadingWidth;
  final double? loadingHeight;
  final Widget? loading;
  final Widget? error;
  final bool skipLoadingOnReload;
  final bool skipLoadingOnRefresh;
  final bool skipError;
  final Function(bool)? isLoading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (value) {
        isLoading?.call(false);
        return data.call(value);
      },
      error: (e, st) {
        isLoading?.call(false);
        return error ??
            const Center(
              child: ErrorMessageWidget(),
            );
      },
      loading: () {
        isLoading?.call(true);
        return loading != null
            ? loading!
            : SizedBox(
                width: loadingWidth,
                height: loadingHeight,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
