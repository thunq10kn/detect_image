import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rem_admin/firebase_options/firebase_options_dev.dart' as dev;
import 'package:rem_admin/firebase_options/firebase_options_prod.dart' as prod;
import 'package:rem_admin/firebase_options/firebase_options_stg.dart' as stg;
import 'package:rem_admin/src/app.dart';
import 'package:rem_admin/src/common/i18n/strings.g.dart';
import 'package:rem_admin/src/common/presentation/screens/error_screen.dart';
import 'package:rem_admin/src/common/router/routes.dart';
import 'package:rem_admin/src/common/utils/env.dart';
import 'package:rem_admin/src/common/utils/logger.dart';
import 'package:rem_admin/src/common/utils/provider_logger.dart';

import 'src/common/presentation/app_loading.dart';

FirebaseOptions get currentFirebaseOption {
  switch (Env.flavor) {
    case Flavor.dev:
      return dev.DefaultFirebaseOptions.currentPlatform;
    case Flavor.stg:
      return stg.DefaultFirebaseOptions.currentPlatform;
    case Flavor.prod:
      return prod.DefaultFirebaseOptions.currentPlatform;
  }
}

void main() async {
  // TODO: ネストした path でリロード効かない問題があるのでコメントアウト
  // // turn off the # in the URLs on the web
  // usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  // init firebase
  await Firebase.initializeApp(options: currentFirebaseOption);

  // Fix screen orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // init locale
  await initializeDateFormatting('ja_JP');
  LocaleSettings.useDeviceLocale();

  // init provider container
  final container = ProviderContainer(
    observers: [
      ProviderLogger(),
    ],
  );

  // TODO: Create provider for FirebaseAnalytics.
  await FirebaseAnalytics.instance.logAppOpen();

  // Register error handlers
  registerErrorHandlers();
  if (!kReleaseMode) {
    final packageInfo = await PackageInfo.fromPlatform();
    logger.i('packageInfo: $packageInfo');
  }
  initLoadingStyle();

  // Entry point of the app
  runApp(
    TranslationProvider(
      child: UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    ),
  );
}

void registerErrorHandlers() {
  // Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    logger.wtf('Uncaught Flutter Error',
        error: details.exception, stackTrace: details.stack);
  };
  // Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    // Pass all uncaught asynchronous errors that aren't handled by
    // the Flutter framework to Crashlytics
    logger.wtf('Uncaught Async Error', error: error, stackTrace: stack);
    return true;
  };
  // Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return ProviderScope(
      overrides: [errorProvider.overrideWithValue(details)],
      child: const ErrorScreen(),
    );
  };
}
