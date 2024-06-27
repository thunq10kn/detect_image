import 'package:flutter/material.dart';

import '../common/presentation/app_colors.dart';

class ButtonRem extends StatelessWidget {
  const ButtonRem(
      {super.key,
      this.title,
      this.callBack,
      this.height,
      this.width,
      this.borderRadius,
      this.fontSize,
      this.fontWeight,
      this.backgroundColor,
      this.colorTitle});

  final String? title;
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? colorTitle;
  final Color? backgroundColor;
  final double? borderRadius;
  final Function? callBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callBack?.call();
      },
      child: Container(
        height: height ?? 28,
        width: width,
        decoration: BoxDecoration(
            gradient: backgroundColor != null
                ? null
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.linerColor3),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 7.2,
                  spreadRadius: 0,
                  offset: const Offset(3.6, 2.9))
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Center(
          child: Text(
            title ?? "",
            style: TextStyle(
                fontWeight: fontWeight ?? FontWeight.w700,
                fontSize: fontSize ?? 12,
                color: colorTitle ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
