import 'dart:io';

import 'package:flutter/foundation.dart';

// ignore: avoid_classes_with_only_static_members
/// Platforms
///
/// A Web-safe Platform class.
///
/// Use this class to determine the platform.
class AppPlatform {
  AppPlatform._();

  static const bool isWeb = kIsWeb;
  static bool isAndroid = !kIsWeb && Platform.isAndroid;
  static bool isIOS = !kIsWeb && Platform.isIOS;
  static bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);
  static bool isDesktop = !kIsWeb &&
      (Platform.isFuchsia ||
          Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isWindows);
  static bool isDesktopOrWeb = isWeb || isDesktop;
}
