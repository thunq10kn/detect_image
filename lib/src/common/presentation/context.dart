import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  // Convenience functions for importing this extension.
  void i() => throw Error();

  // Theme
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorTheme => Theme.of(this).colorScheme;
  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  // MediaQuery
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnack(
    SnackBar snackBar,
  ) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
