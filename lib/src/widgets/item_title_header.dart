import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';

class ItemTitleHeader extends StatelessWidget {
  const ItemTitleHeader({super.key, this.title, this.subTitle});

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.customColor11),
            ),
            const Gap(20),
            Expanded(
                child: Text(
              subTitle ?? '',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.customColor30,
                fontFamily: 'NotoSansJP',
              ),
            ))
          ],
        ),
        const Gap(11),
        Divider(
          color: AppColors.customColor17,
        )
      ],
    );
  }
}
