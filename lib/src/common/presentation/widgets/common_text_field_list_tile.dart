import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../app_sizes.dart';

class CommonTextFieldListTile extends StatelessWidget {
  const CommonTextFieldListTile({
    super.key,
    required this.title,
    this.titleColor,
    this.titleIconPath,
    this.detail,
    this.detailColor,
    this.trailing,
    this.onTap,
    this.contentPadding,
  });

  final String title;
  final Color? titleColor;
  final String? titleIconPath;
  final String? detail;
  final Color? detailColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        title: Row(
          children: [
            if (titleIconPath != null)
              Row(
                children: [
                  Image.asset(
                    titleIconPath!,
                    width: 24,
                    fit: BoxFit.fitWidth,
                  ),
                  const Gap(AppSizes.p16),
                ],
              ),
            Text(
              title,
              style: TextStyle(color: titleColor),
            ),
            const Gap(AppSizes.p16),
            if (detail != null)
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    detail!,
                    style: TextStyle(color: detailColor),
                  ),
                ),
              ),
          ],
        ),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
        contentPadding: contentPadding,
      ),
    );
  }
}
