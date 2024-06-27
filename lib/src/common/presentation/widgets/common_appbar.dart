import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'buttons.dart';

class CommonAppbar extends HookConsumerWidget implements PreferredSizeWidget {
  const CommonAppbar({
    super.key,
    required this.title,
    this.leading,
    this.automaticallyImplyLeading = true,
  });

  final String title;
  final Widget? leading;
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title),
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: [
        CommonTextButton(
          text: 'ログアウト',
          onPressed: () async {
          },
        ),
      ],
    );
  }
}
