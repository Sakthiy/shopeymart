import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/image_strings.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/UI/SplashScreen/Ctrl/splash_screen_ctrl.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  final splashScreenCtrl = Get.put(SplashScreenCtrl());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageStrings.noInternet,
                width: Get.size.width / 1.3,
              ),
              SizedBox(height: AppDouble.double50.h),
              Text(
                AppStrings.noInternetConnection,
                style: TextStyle(
                  fontSize: AppDouble.double18.sp,
                  fontWeight: FontWeight.bold,
                  color: MyColors.blackColor,
                ),
              ),
              SizedBox(height: AppDouble.double16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDouble.double10).w,
                child: Text(
                  AppStrings.noInternetMsg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: AppDouble.double16.sp,
                    // fontWeight: FontWeight.bold,
                    color: MyColors.blackColor,
                  ),
                ),
              ),
              SizedBox(height: AppDouble.double50.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDouble.double10).w,
                child: MyButton(
                  title: AppStrings.tryAgain,
                  onTap: splashScreenCtrl.isInternet.value
                      ? () => Get.back()
                      : () {},
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
