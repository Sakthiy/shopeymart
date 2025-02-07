import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/text_form_field.dart';
import 'package:shopeymart/CommonFiles/validator_email_phone_num.dart';
import 'package:shopeymart/UI/ForgotPassword/Ctrl/forgot_password_ctrl.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder(
        init: ForgotPasswordCtrl(),
        builder: (ctrl) => Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: SingleChildScrollView(
            child: Form(
              key: ctrl.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Lottie.asset('assets/lottie/forgot_password.json',
                      repeat: false),
                  Text(
                    AppStrings.forgetPassword,
                    style: MyTextStyle.poppinsExtraBoldTextStyle.copyWith(
                      letterSpacing: 0,
                      fontSize: AppDouble.double22.sp,
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  Text(AppStrings.emailVerificationProcess),
                  SizedBox(height: 15.0.h),
                  MyTextFormField(
                    controller: ctrl.emailOrPhoneCtrl,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDouble.double8).r,
                    ),
                    prefixIcon: const Icon(Iconsax.sms),
                    validator: (input) =>
                        ValidatorEmailPhoneNum.isEmailOrPhone(input)
                            ? null
                            : AppStrings.invalidEmailOrPhoneLabel,
                    label: AppStrings.emailOrPhoneLabel,
                  ),
                  SizedBox(height: 35.0.h),
                  MyButton(
                    title: AppStrings.continueLabel,
                    onTap: () {
                      if (ctrl.formKey.currentState!.validate()) {
                        ctrl.apiCall(context,ctrl.emailOrPhoneCtrl.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
