import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading.g.dart';

/// Provider of whether to show overlay loader or not
@riverpod
class OverlayLoading extends _$OverlayLoading {
  @override
  bool build() {
    return false;
  }
}

/// Overlay loader to prevent consecutive hits.
class OverlayLoader extends StatelessWidget {
  const OverlayLoader({
    super.key,
    this.backgroundColor = Colors.black26,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
