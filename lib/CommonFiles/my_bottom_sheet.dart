import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';

class MyBottomSheet {
  static myBottomSheet({
    required String title,
    required String buttonText,
    String? lottieFile,
    GestureTapCallback? onTap,
    FontWeight? fontWeight,
  }) =>
      Get.bottomSheet(
        isDismissible: false,
        StatefulBuilder(
          builder: (context, setState) => Container(
            padding: const EdgeInsets.all(18.0).r,
            width: Get.size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ).r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  lottieFile ?? 'assets/lottie/success-animation.json',
                  height: 160.h,
                  repeat: false,
                ),
                SizedBox(height: 20.0.h),
                SizedBox(
                  width: 300,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: MyTextStyle.poppinsExtraBoldTextStyle.copyWith(
                      letterSpacing: 0,
                      fontSize: AppDouble.double22.sp,
                    ),
                  ),
                ),
                SizedBox(height: 25.0.h),
                MyButton(
                  fontWeight: fontWeight ?? FontWeight.w600,
                  onTap: onTap,
                  title: buttonText,
                ),
              ],
            ),
          ),
        ),
      );

  static myDialog({required String message, required String errorCode}) =>
      Get.defaultDialog(
        barrierDismissible: false,
        onWillPop: ()async{
          return false;
        },
        title: '${AppStrings.error} $errorCode',
        content: Text(message),
        onCancel: () => Get.back(),
        onConfirm: () => SystemNavigator.pop(),
      );

  static myLoader() {
    Get.dialog(
        barrierDismissible: false,
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  padding: const EdgeInsets.all(16.0).r,
                  height: 60.w,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const CircularProgressIndicator()),
            ],
          ),
        ));
  }
}
