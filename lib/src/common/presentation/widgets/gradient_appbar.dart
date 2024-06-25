import 'package:flutter/material.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.leadingWidth = 56,
    this.elevation = 2.0,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final double leadingWidth;
  final List<Widget>? actions;

  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [
              0.0,
              0.27,
            ],
            colors: AppColors.linerColor,
          ),
        ),
        child: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          leadingWidth: leadingWidth,
          elevation: elevation,
          title: title,
          backgroundColor: Colors.transparent,
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
