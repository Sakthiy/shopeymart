import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';

class MyButton extends StatelessWidget {
  final String title;
  final GestureTapCallback? onTap;
  final String? image;
  final Color? containerColor;
  final Color? textColor;
  final Color? borderColor;
  final double? fontSize;
  final double? textLetterSpacing;
  final double screenWithDivider;
  final FontWeight? fontWeight;
  final EdgeInsets? textPadding;
  final double? borderRadius;
  const MyButton({
    super.key,
    required this.title,
    this.image,
    this.fontSize,
    this.borderColor,
    this.containerColor,
    this.textColor,
    this.onTap,
    this.screenWithDivider = 3.5,
    this.fontWeight,
    this.textPadding,
    this.borderRadius,
    this.textLetterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: textPadding ?? MyPadding.symmetricEdgeInsetsH10V15,
        decoration: borderColor == null
            ? BoxDecoration(
                color: containerColor ?? MyColors.primaryColor,
                borderRadius:
                    BorderRadius.circular(borderRadius ?? AppDouble.double8).r,
              )
            : BoxDecoration(
                color: containerColor ?? MyColors.primaryColor,
                borderRadius:
                    BorderRadius.circular(borderRadius ?? AppDouble.double8).r,
                border: Border.all(color: borderColor!),
              ),
        child: Row(
          mainAxisAlignment: image == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            image == null
                ? const SizedBox()
                : SvgPicture.asset(image!, height: AppDouble.double18.h),
            image == null
                ? const SizedBox()
                : SizedBox(width: Get.size.width / screenWithDivider),
            Text(
              title,
              style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                color: textColor,
                fontWeight: fontWeight ?? FontWeight.bold,
                fontSize: fontSize ?? 18.sp,
                letterSpacing: textLetterSpacing ?? 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
