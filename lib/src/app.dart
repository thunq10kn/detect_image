import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/presentation/scaffold_messenger.dart';
import 'package:rem_admin/src/common/presentation/theme.dart';
import 'package:rem_admin/src/common/presentation/widget_ref.dart';
import 'package:rem_admin/src/common/router/app_router.dart';

import 'common/i18n/strings.g.dart';
import 'common/presentation/widgets/loading.dart';
import 'common/utils/dimens.dart';
import 'common/utils/local_storage_helper.dart';

class MyApp extends StatefulHookConsumerWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    html.window.onBeforeUnload.listen((event) {
      AppPreferencesHelper().setDateOffline(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final router = ref.watch(routerProvider);
    final lightTheme = ref.watch(themeProvider(brightness: Brightness.light));
    final darkTheme = ref.watch(themeProvider(brightness: Brightness.dark));

    // It monitors whether the login was successful.
    // Normally, it would be natural to monitor with [LoginSmsCodeScreen],
    // but in that case, the transition to the next screen will occur
    // before the login process is completed,
    // so [signInWithPhoneNumberResultControllerProvider] will be disposed
    // and [OverlayLoader] will not close.
    return MaterialApp.router(
      locale: TranslationProvider.of(context).flutterLocale,
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      routerConfig: router,
      title: t.title,
      theme: lightTheme,
      // TODO: Check with the client whether dark mode is necessary.
      // darkTheme: kReleaseMode ? null : darkTheme,
      builder: (context, child) => Consumer(
        builder: (context, ref, _) {
          final isLoading = ref.watch(overlayLoadingProvider);
          Dimens.init(context);
          child = EasyLoading.init()(context,child);
          return MediaQuery(
            // Fix font size settings on all devices
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1)).copyWith(alwaysUse24HourFormat: true),
            child: Stack(
              children: [
                child!,
                // Watch loading status and show loading if necessary
                if (isLoading) const OverlayLoader(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
