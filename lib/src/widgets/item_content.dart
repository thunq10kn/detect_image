import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';

class ItemContent extends StatelessWidget {
  const ItemContent({
    super.key,
    this.title,
    this.subTitle,
    this.subTitleColor,
    this.paddingTop,
    this.marginTop,
    required this.child,
    this.errorText,
    this.isRequire = false,
  });

  final String? title;
  final String? subTitle;
  final double? paddingTop;
  final double? marginTop;
  final Color? subTitleColor;
  final bool? isRequire;
  final Widget child;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(top: paddingTop ?? 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            style: TextStyle(
                                color: AppColors.customColor18,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          if (subTitle != null) const Gap(3),
                          if (subTitle != null)
                            Text(
                              subTitle ?? '',
                              style: TextStyle(
                                  color:
                                      subTitleColor ?? AppColors.customColor19,
                                  fontSize: 11),
                            )
                        ],
                      )),
                ),
                if (isRequire == true)
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        color: AppColors.customColor20,
                        borderRadius: BorderRadius.circular(5)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: const Center(
                      child: Text(
                        "必須",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                const Gap(17)
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                child,
                if (errorText != null) ...[
                  const Gap(8),
                  Text(
                    errorText!,
                    style: const TextStyle(color: Colors.red),
                  )
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
