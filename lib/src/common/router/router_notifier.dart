import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../presentation/widgets/scaffold_with_nav_bar.dart';
import '../utils/enum.dart';
import 'routes.dart';

part 'router_notifier.g.dart';

/// This notifier is meant to implement the [Listenable] our [GoRouter] needs.
///
/// We aim to trigger redirects whenever's needed.
/// This is done by calling our (only) listener everytime we want to notify stuff.
/// This allows to centralize global redirecting logic in this class.
/// In this simple case, we just listen to auth changes.
///
/// SIDE NOTE.
/// This might look overcomplicated at a first glance;
/// Instead, this method aims to follow some good some good practices:
///   1. It doesn't require us to pipe down any `ref` parameter
///   2. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
///   3. It allows for listening to multiple providers if needed (we do have a [Ref] now!)
@Riverpod(keepAlive: true)
class RouterNotifier extends _$RouterNotifier implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false; // Useful for our global redirect function

  @override
  Future<void> build() async {
    // One could watch more providers and write logic accordingly

    // Monitor AppUser login status.

    ref.listenSelf((_, __) {
      if (state.isLoading) {
        return;
      }
      routerListener?.call();
    });
  }

  /// Redirects the user when our authentication changes
  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) {
      return null;
    }
    // final isSplash = state.location == SplashRoute.path;
    final location = state.uri.toString();
    final isSplash = location == const SplashRoute().location;


    const resetPasswordPath = '/reset-password/';
    final queryParams = state.uri.queryParameters;
    final oobCode = queryParams['oobCode'];
    if (queryParams['mode'] == FirebaseAuthMode.resetPassword.name &&
        oobCode != null) {
      return resetPasswordPath + oobCode;
    }

    if (location.startsWith(resetPasswordPath)) {
      return null;
    }

    // splash 画面のとき、認証済みならホーム画面に飛ばす。
    // 認証済みだが、登録フローが終わっていない場合は登録フローに飛ばす。
    // 認証済みでない場合は、PageView の画面に飛ばす。
    return const LoginRoute().location;
  }

  static const _unAuthPath = ['/forgot-password', '/signup'];

  /// Our application routes. Obtained through code generation
  List<RouteBase> get routes => [
        // GoRouter Type Routingの場合、ShellRouteをネストする方法がない？ので、ここに書く。NavBar表示非表示は、ScaffoldWithNavBar内で制御する。
        // https://github.com/flutter/flutter/issues/111909
        ShellRoute(
          routes: $appRoutes,
          builder: (context, state, child) => ScaffoldWithNavBar(
            child: child,
          ),
        )
      ];

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}
