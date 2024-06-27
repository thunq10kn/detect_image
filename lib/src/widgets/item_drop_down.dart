import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rem_admin/src/common/presentation/app_colors.dart';
import 'package:rem_admin/src/common/presentation/app_images.dart';
import 'package:rem_admin/src/common/utils/dimens.dart';
import 'package:rem_admin/src/common/utils/image_helper/imagehelper.dart';

class ItemDropDown extends StatelessWidget {
  const ItemDropDown({
    super.key,
    this.value,
    this.callBack,
    this.width,
    this.borderRadius,
    this.datas,
    this.backgroundColor
  });

  final String? value;
  final List<dynamic>? datas;
  final Function(dynamic)? callBack;
  final double? width;
  final double? borderRadius;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Dimens.screenWidth,
      margin: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<String>(
              icon: ImageHelper.loadFromAsset(AppAssets.icDropDown,
                  width: 14, height: 6),
              // style: TextStyle(fontSize: 12, color: AppColors.customColor22),
              hint: Text(
                value ?? '',
                style: const TextStyle(fontSize: 13, color: AppColors.black),
              ),
              items: datas?.map<DropdownMenuItem<String>>((dynamic item) {
                return DropdownMenuItem<String>(
                  value: item.toString(),
                  enabled: true,
                  child: Text(
                    item.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                callBack?.call(newValue!);
              },
              iconDisabledColor: Colors.black,
              iconEnabledColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  borderSide:
                      BorderSide(color: AppColors.customColor32, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  borderSide:
                  BorderSide(color: AppColors.customColor32, width: 1),
                ),
                fillColor: backgroundColor ?? Colors.white,
                isDense: true,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  borderSide:
                      BorderSide(color: AppColors.customColor32, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
