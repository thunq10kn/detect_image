import 'package:rem_admin/src/common/presentation/widgets/dialogs.dart';
import 'package:rem_admin/src/common/router/router_notifier.dart';
import 'package:rem_admin/src/common/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Exception string thrown by GoRouter if route is not found.
final noRouteExceptionRegex = RegExp(r'Exception: no routes for location');

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: ref.watch(navigatorKeyProvider),
    refreshListenable: notifier,
    debugLogDiagnostics: !kReleaseMode,
    initialLocation: const SplashRoute().location,
    routes: notifier.routes,
    errorBuilder: (context, state) =>
        ErrorRoute(state.error).build(context, state),
    redirect: notifier.redirect,
  );
}
