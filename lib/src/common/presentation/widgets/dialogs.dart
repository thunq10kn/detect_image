import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/i18n/strings.g.dart';
import 'package:rem_admin/src/common/presentation/error_message.dart';
import 'package:rem_admin/src/common/utils/localization/string_hardcoded.dart';
import 'package:rem_admin/src/common/utils/platforms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../image.dart';
import 'buttons.dart';

part 'dialogs.g.dart';

/// GlobalKey for dialog display
@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(NavigatorKeyRef ref) {
  return GlobalKey<NavigatorState>();
}

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
  Function? callBackOk,
  Function? callBackCancel,
  bool centerContent = false,
}) async {
  if (!AppPlatform.isIOS) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: cancelActionText != null,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content != null
            ? Text(
                content,
                textAlign: centerContent ? TextAlign.center : TextAlign.start,
              )
            : null,
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText),
              onPressed: () {
                if (callBackCancel != null) {
                  callBackCancel.call();
                }
                Navigator.of(context).pop(false);
              },
            ),
          TextButton(
            child: Text(defaultActionText),
            onPressed: () {
              if (callBackOk != null) {
                callBackOk.call();
              }
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );
  }
  return showCupertinoDialog<bool>(
    context: context,
    barrierDismissible: cancelActionText != null,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: content != null ? Text(content) : null,
      actions: <Widget>[
        if (cancelActionText != null)
          CupertinoDialogAction(
            child: Text(cancelActionText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        CupertinoDialogAction(
          child: Text(defaultActionText),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

// /// ErrorDialog
// class ErrorDialog extends StatelessWidget {
//   const ErrorDialog({
//     super.key,
//     required this.message,
//   });

//   final String message;

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(t.errorDialog.error),
//       content: Text(message),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(),
//           child: Text(t.errorDialog.ok),
//         ),
//       ],
//     );
//   }
// }

/// ConfirmDialog
class ConfirmDialog extends ConsumerWidget {
  const ConfirmDialog({
    super.key,
    this.title,
    this.message,
    required this.onApproved,
  });

  final String? title;
  final String? message;
  final VoidCallback? onApproved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!) : null,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(t.confirmDialog.no),
        ),
        CommonTextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            onApproved?.call();
          },
          text: t.confirmDialog.yes,
        ),
      ],
    );
  }
}

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: exception.toString(),
      defaultActionText: 'OK'.hc,
    );

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<void> showErrorDialog({
  required BuildContext context,
  required Object error,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('エラー'),
      content: Text(error.errorMessage),
      actions: <Widget>[
        CommonTextButton(
          text: 'OK',
          onPressed: () async => context.pop(),
        ),
      ],
    ),
  );
}

Future<void> showImageDialog({
  required BuildContext context,
  required List<ImageDialogModel> images,
  int selectedIndex = 0,
}) async {
  final isSmallScreen = MediaQuery.of(context).size.width < 800;
  final padding = isSmallScreen ? 10.0 : 100.0;
  return showDialog(
    context: context,
    builder: (_) => SimpleDialog(
      insetPadding: EdgeInsets.all(padding),
      contentPadding: EdgeInsets.zero,
      children: [
        _ImageView(
          images: images,
          selectedIndex: selectedIndex,
        )
      ],
    ),
  );
}

class _ImageView extends HookWidget {
  const _ImageView({
    required this.images,
    required this.selectedIndex,
  });

  final List<ImageDialogModel> images;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    final containerWidth = MediaQuery.of(context).size.width - 10 * 2;
    final containerHeight = MediaQuery.of(context).size.height - 100 * 3;
    final index = useState(selectedIndex);
    final controller = PageController(initialPage: selectedIndex);
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          width: isSmallScreen ? containerWidth : containerHeight,
          height: isSmallScreen ? containerWidth : containerHeight,
          padding: const EdgeInsets.all(20),
          child: PageView.builder(
            itemCount: images.length,
            controller: controller,
            onPageChanged: (int idx) => index.value = idx,
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == index.value ? 1 : 0.9,
                child: Hero(
                  tag: images[i].imageTag,
                  child: ImageWidget(
                    imageURL: images[i].imagePath,
                  ),
                ),
              );
            },
          ),
        ),
        if (images.length > 1)
          Row(
            children: [
              const Spacer(),
              CommonIconButton(
                onPressed: index.value != 0
                    ? () => controller.animateToPage(
                          index.value - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn,
                        )
                    : null,
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              Text('${index.value + 1}/${images.length}'),
              CommonIconButton(
                onPressed: index.value != images.length - 1
                    ? () => controller.animateToPage(
                          index.value + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn,
                        )
                    : null,
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
              const Spacer(),
            ],
          ),
      ],
    );
  }
}

class ImageDialogModel {
  ImageDialogModel({required this.imagePath, required this.imageTag});

  final String imagePath;
  final String imageTag;
}

Future<void> showConfirmDialog({
  required BuildContext context,
  String? title,
  String? message,
  void Function()? onApproved,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => ConfirmDialog(
      title: title,
      message: message,
      onApproved: onApproved,
    ),
  );
}
