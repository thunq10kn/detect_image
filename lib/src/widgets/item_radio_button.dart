import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';

import '../common/presentation/app_images.dart';

class ItemRadioButton extends StatelessWidget {
  const ItemRadioButton(
      {super.key,
      this.isChecked = false,
      this.title,
      this.onTap,
      this.marginRight});

  final bool? isChecked;
  final double? marginRight;
  final String? title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight ?? 20),
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Row(
          children: [
            ImageHelper.loadFromAsset(
                isChecked == true ? AppAssets.icChecked : AppAssets.icUnChecked,
                width: 23.5,
                height: 23.5),
            const Gap(7),
            Text(
              title ?? '',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.customColor18),
            )
          ],
        ),
      ),
    );
  }
}
