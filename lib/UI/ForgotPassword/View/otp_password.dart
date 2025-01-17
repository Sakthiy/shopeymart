import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/ForgotPassword/Ctrl/otp_password_ctrl.dart';

class ForgetOTPPassword extends StatefulWidget {
  const ForgetOTPPassword({super.key});

  @override
  State<ForgetOTPPassword> createState() => _ForgetOTPPasswordState();
}

class _ForgetOTPPasswordState extends State<ForgetOTPPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder(
        init: OTPPasswordCtrl(),
        builder: (oTPPassword) => Padding(
          padding: MyPadding.edgeInsets15.r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppDouble.double30.h),
              Text(
                AppStrings.enterOTP,
                style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
                  fontSize: AppDouble.double28.sp,
                ),
              ),
              SizedBox(height: AppDouble.double10.h),
              Text(
                AppStrings.pleaseEnterTheOTPSandTo,
                style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                  color: MyColors.greyColor,
                  fontSize: AppDouble.double15.sp,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "+91 ${oTPPassword.mobileNumber.value}",
                    style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: AppDouble.double15.sp,
                    ),
                  ),
                  SizedBox(width: AppDouble.double10.h),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Iconsax.edit_2,
                      color: MyColors.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppDouble.double20.h),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                controller: oTPPassword.otpTextEditingCtrl,
                defaultPinTheme: PinTheme(
                    padding: MyPadding.symmetricEdgeInsetsH10V15.r,
                    decoration: BoxDecoration(
                      color: MyColors.lightBlueBGColor,
                      shape: BoxShape.circle,
                    ),
                    textStyle: TextStyle(
                      fontSize: AppDouble.double20.sp,
                    )),
              ),
              SizedBox(height: AppDouble.double10.h),
              Padding(
                padding: EdgeInsets.only(right: AppDouble.double18).r,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.resendOTP,
                    style: MyTextStyle.poppinsSemiBoldTextStyleF15.copyWith(
                      color: MyColors.primaryColor,
                      // decoration: TextDecoration.underline,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDouble.double100.h),
              MyButton(
                onTap: () => Get.toNamed(Routes.createPasswordScreen),
                title: AppStrings.submit,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
