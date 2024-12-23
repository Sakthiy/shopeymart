import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';

class SeeMoreTile extends StatelessWidget {
  final String title;
  final String? buttonText;
  final Widget? icon;
  final bool? isMore;
  final EdgeInsetsGeometry? padding;
  final bool? isPadding;
  final VoidCallback? onPressed;
  const SeeMoreTile({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
    this.buttonText,
    this.isMore = true,
    this.isPadding = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isPadding!
          ? padding ?? MyPadding.horizontalEdgeInsets20
          : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
              fontSize: AppDouble.double15.sp,
            ),
          ),
          isMore!
              ? TextButton.icon(
                  onPressed: onPressed,
                  icon: Text(
                    buttonText ?? AppStrings.viewAll,
                    style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                      color: MyColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  label: icon ??
                      Icon(
                        Icons.arrow_forward_sharp,
                        size: AppDouble.double18.sp,
                        color: MyColors.greyColor,
                      ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
