import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/CommonFiles/text_form_field.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Login/Ctrl/signup_ctrl.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder(
          init: SignupCtrl(),
          builder: (ctrl) => Form(
            key: ctrl.formKey,
            child: ListView(
              padding: MyPadding.edgeInsets15.r,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'assets/lottie/Signup.json',
                    height: 230.h,
                  ),
                ),
                Text(
                  AppStrings.signupWithEmail,
                  style: MyTextStyle.poppinsExtraBoldTextStyle.copyWith(
                    letterSpacing: 0,
                    fontSize: AppDouble.double22.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                MyTextFormField(
                  controller: ctrl.emailOrPhoneNoTextCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.emailOrPhoneLabel;
                    }
                    return null;
                  },
                  prefixIcon: const Icon(Iconsax.sms),
                  label: AppStrings.phoneEmailId,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppDouble.double8).r,
                  ),
                ),
                SizedBox(height: 20.h),
                // MyTextFormField(
                //   controller: ctrl.passwordTextCtrl,
                //   prefixIcon: const Icon(Iconsax.lock),
                //   label: AppStrings.password,
                //   obscureText: !ctrl.isPasswordView.value,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return AppStrings.enterPassword;
                //     }
                //     return null;
                //   },
                //   suffixIcon: GestureDetector(
                //     onTap: () {
                //       ctrl.passwordView();
                //       ctrl.update();
                //     },
                //     child: Icon(
                //       ctrl.isPasswordView.value ? Iconsax.eye : Iconsax.eye_slash,
                //     ),
                //   ),
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(AppDouble.double8).r,
                //   ),
                // ),
                // SizedBox(height: 20.h),
                // MyTextFormField(
                //   controller: ctrl.confirmPasswordTextCtrl,
                //   prefixIcon: const Icon(Iconsax.lock),
                //   label: AppStrings.confirmPassword,
                //   obscureText: !ctrl.isConfirmPasswordView.value,
                //   suffixIcon: GestureDetector(
                //     onTap: () {
                //       ctrl.confirmPasswordView();
                //       ctrl.update();
                //     },
                //     child: Icon(
                //       ctrl.isConfirmPasswordView.value
                //           ? Iconsax.eye
                //           : Iconsax.eye_slash,
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return AppStrings.enterConfirmPassword;
                //     }
                //     if (value.toString() != ctrl.passwordTextCtrl.text) {
                //       return AppStrings.confirmPasswordMismatching;
                //     }
                //     return null;
                //   },
                //   border: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(AppDouble.double8).r,
                //   ),
                // ),
                // SizedBox(height: 25.h),
                MyButton(
                  title: AppStrings.signup,
                  onTap: () {
                    if (ctrl.formKey.currentState!.validate()) {
                      // if (ctrl.passwordTextCtrl.text ==
                      //     ctrl.confirmPasswordTextCtrl.text) {
                      //
                      // } else {
                      //   MyBottomSheet.myDialog(
                      //     message: AppStrings.confirmPasswordMismatching,
                      //     errorCode: AppStrings.password,
                      //   );
                      // }
                      ctrl.phoneAuthentication(
                          ctrl.emailOrPhoneNoTextCtrl.text.trim());
                      FocusScope.of(context).unfocus();
                      // MyBottomSheet.myBottomSheet(
                      //     title: AppStrings.signupSuccessfully,
                      //     buttonText: AppStrings.done,
                      //     onTap: () => Get.offAllNamed(Routes.loginScreen));
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
