import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/presentation/app_images.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';


class ItemImage extends HookConsumerWidget {
  const ItemImage({super.key, this.path, this.index,this.isHiddenAction = false,this.id});

  final Uint8List? path;
  final int? index;
  final int? id;
  final bool? isHiddenAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isHiddenAction == true ? Image.memory(
      path!,
      fit: BoxFit.cover,
    ) : Container(
      height: 257,
      padding: const EdgeInsets.only(top: 5, right: 6, bottom: 10, left: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.customColor28),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 22,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "${(index ?? 0) + 1}",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.customColor29),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: ImageHelper.loadFromAsset(AppAssets.icNavi,
                        width: 8, height: 4),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: Image.memory(
              path!,
              fit: BoxFit.cover,
            ),
          )),
          const Gap(7),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                },
                child: Text(
                  "編集",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.customColor29),
                ),
              ),
              Text(
                " / ",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.customColor29),
              ),
              GestureDetector(
                onTap: () {

                },
                child: Text(
                  "削除",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.customColor29),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
