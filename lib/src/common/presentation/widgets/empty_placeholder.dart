import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../i18n/strings.g.dart';
import '../../router/routes.dart';
import '../app_sizes.dart';
import 'buttons.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholder extends StatelessWidget {
  const EmptyPlaceholder({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonElevatedButton(
              onPressed: () async => const SplashRoute().go(context),
              text: t.emptyPlaceholderWidget.goHome,
            ),
            const Gap(AppSizes.p32),
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
