import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const warning = Color(0xFFF4B400);

CustomColors lightCustomColors = const CustomColors(
  sourceWarning: Color(0xFFF4B400),
  warning: Color(0xFF7A5900),
  onWarning: Color(0xFFFFFFFF),
  warningContainer: Color(0xFFFFDEA3),
  onWarningContainer: Color(0xFF261900),
);

CustomColors darkCustomColors = const CustomColors(
  sourceWarning: Color(0xFFF4B400),
  warning: Color(0xFFFDBC13),
  onWarning: Color(0xFF402D00),
  warningContainer: Color(0xFF5D4200),
  onWarningContainer: Color(0xFFFFDEA3),
);

/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceWarning,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
  });

  final Color? sourceWarning;
  final Color? warning;
  final Color? onWarning;
  final Color? warningContainer;
  final Color? onWarningContainer;

  @override
  CustomColors copyWith({
    Color? sourceWarning,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
  }) {
    return CustomColors(
      sourceWarning: sourceWarning ?? this.sourceWarning,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceWarning: Color.lerp(sourceWarning, other.sourceWarning, t),
      warning: Color.lerp(warning, other.warning, t),
      onWarning: Color.lerp(onWarning, other.onWarning, t),
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t),
      onWarningContainer:
          Color.lerp(onWarningContainer, other.onWarningContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  CustomColors harmonized(ColorScheme dynamic) {
    return copyWith();
  }
}
