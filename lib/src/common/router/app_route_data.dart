import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../utils/platforms.dart';

/// GoRouteData
extension GoRouteDataEx on GoRouteData {
  /// Helper function for the buildPage method to set
  /// the appropriate page transition for each platform.
  ///
  /// Call this in the buildPage method that you override in your subclass.
  ///
  /// ? There may be a more preferable way to implement this instead of
  /// defining it in the GoRouteData extension.
  Page<void> buildAppPage(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    if (AppPlatform.isIOS) {
      return CupertinoPage(child: child);
    }
    if (AppPlatform.isAndroid) {
      // TODO: replace with ZoomPage transition
      return NoTransitionPage(child: child);
    }
    return NoTransitionPage(child: child);
  }
}
