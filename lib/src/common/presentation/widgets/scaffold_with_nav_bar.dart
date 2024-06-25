import 'dart:core';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/presentation/app_images.dart';
import 'package:rem_admin/src/common/utils/dimens.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';

import 'common_sidebar.dart';

class ScaffoldWithNavBar extends HookConsumerWidget {
  ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmallScreen = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      key: _key,
      backgroundColor: AppColors.customColor10,
      body: Column(
        children: [
          if (_isNavVisible(context))
            Container(
              padding: const EdgeInsets.only(
                  left: 98, right: 20, top: 10, bottom: 10),
              width: Dimens.screenWidth,
              color: Colors.white,
              child: Row(
                children: [
                  ImageHelper.loadFromAsset(AppAssets.icLogoColor,
                      width: 128, height: 46),
                  const Spacer(),
                  const Gap(21),
                ],
              ),
            ),
          Expanded(
              child: Row(
            children: [
              if (!isSmallScreen && _isNavVisible(context)) CommonSidebar(),
              Expanded(
                child: Center(
                  child: child,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  // ナビゲーションを表示するかどうかを判別する関数
  // GoRouter Type Routingの場合、ShellRouteをネストする方法がない？ので全体をラップして、表示はここで制御する。
  // https://github.com/flutter/flutter/issues/111909
  bool _isNavVisible(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString().split('/');
    if (location.length > 1) {
      return SideNavType.values.any((e) => e.path.contains(location[1]));
    }
    return false;
  }
}
