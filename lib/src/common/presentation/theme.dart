import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:rem_admin/src/common/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/platforms.dart';
import 'color_schemes.g.dart';

part 'theme.g.dart';

const _fontFamily = 'NotoSansJP';

/// Theme of the app.
@riverpod
ThemeData theme(
  ThemeRef ref, {
  required Brightness brightness,
}) {
  final isLight = brightness == Brightness.light;
  final base = isLight
      ? ThemeData.light(useMaterial3: true)
      : ThemeData.dark(useMaterial3: true);
  final textColor = isLight ? AppColors.textBlack : null;

  return ThemeData(
    useMaterial3: base.useMaterial3,
    scaffoldBackgroundColor: isLight ? AppColors.white : AppColors.black,
    colorScheme: lightColorScheme,
    // * Eliminate differences between the appearance of
    // * the web version and the mobile version
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    // * fontFamily is used to prevent Japanese garbled characters
    // * when rendering the web with webkit
    fontFamily: AppPlatform.isWeb && Env.webRenderer == WebRenderer.html
        ? null
        : _fontFamily,
    textTheme: base.textTheme.copyWith(
      displayLarge: base.textTheme.displayLarge!.copyWith(
        color: textColor,
      ),
      displayMedium: base.textTheme.displayMedium!.copyWith(
        color: textColor,
      ),
      displaySmall: base.textTheme.displaySmall!.copyWith(
        color: textColor,
      ),
      headlineMedium: base.textTheme.headlineMedium!.copyWith(
        color: textColor,
      ),
      headlineSmall: base.textTheme.headlineSmall!.copyWith(
        color: textColor,
      ),
      titleLarge: base.textTheme.titleLarge!.copyWith(
        color: textColor,
      ),
      titleMedium: base.textTheme.titleMedium!.copyWith(
        color: textColor,
      ),
      titleSmall: base.textTheme.titleSmall!.copyWith(
        color: textColor,
      ),
      bodyLarge: base.textTheme.bodyLarge!.copyWith(
        color: textColor,
      ),
      bodyMedium: base.textTheme.bodyMedium!.copyWith(
        color: textColor,
      ),
      bodySmall: base.textTheme.bodySmall!.copyWith(
        color: textColor,
      ),
      labelLarge: base.textTheme.labelLarge!.copyWith(
        color: textColor,
      ),
      labelSmall: base.textTheme.labelSmall!.copyWith(
        color: textColor,
      ),
    ),
  );
}
