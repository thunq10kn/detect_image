import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../app.dart';
import '../../common/presentation/screens/error_screen.dart';
import '../../common/router/app_route_data.dart';
import '../../screens/authentication/screens/home_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(
  path: '/splash',
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildAppPage(
      context,
      state,
      const SplashPage(),
    );
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return buildAppPage(
      context,
      state,
       LoginScreen(),
    );
  }
}

@riverpod
Object? error(ErrorRef ref) {
  throw UnimplementedError();
}

class ErrorRoute extends GoRouteData {
  const ErrorRoute(this.error);
  final Object? error;

  /// Because it is called in [GoRouter].errorBuilder,
  /// it overrides build instead of buildPage.
  @override
  Widget build(BuildContext context, GoRouterState state) => ProviderScope(
        overrides: [
          errorProvider.overrideWithValue(error),
        ],
        child: const ErrorScreen(),
      );
}
