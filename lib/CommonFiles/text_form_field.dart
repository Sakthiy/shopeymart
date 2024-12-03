import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';

class MyTextFormField extends StatelessWidget {
  final String? label;
  final bool? filled;
  final bool? obscureText;
  final bool isRedStart;
  final Widget? prefixIcon;
  final String? hintText;
  final Color? fillColor;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final TextAlign textAlign;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final BorderSide? borderSide;
  final TextEditingController? controller;
  const MyTextFormField({
    super.key,
    this.label,
    this.controller,
    this.prefixIcon,
    this.filled,
    this.fillColor,
    this.hintText,
    this.suffixIcon,
    this.border,
    this.borderSide,
    this.focusedBorder,
    this.enabledBorder,
    this.obscureText = false,
    this.isRedStart = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      maxLines: maxLines,
      textAlign: textAlign,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: AppDouble.double15.sp,
        ),
        suffixIcon: suffixIcon,
        label: isRedStart
            ? RichText(
                text: TextSpan(
                text: label,
                style: TextStyle(
                  fontFamily: 'Poppins-Medium',
                  color: MyColors.blackColor54,
                  fontSize: AppDouble.double14.sp,
                ),
                children: [
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontFamily: 'Poppins-Medium',
                      color: MyColors.redColor,
                      fontSize: AppDouble.double17.sp,
                    ),
                  ),
                ],
              ))
            : label == null
                ? null
                : Text(
                    label!,
                    style: const TextStyle(
                      fontFamily: 'Poppins-Medium',
                    ),
                  ),
        prefixIcon: prefixIcon,
        border: border,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
      ),
    );
  }
}
