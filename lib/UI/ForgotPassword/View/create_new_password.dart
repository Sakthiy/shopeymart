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
import 'package:shopeymart/CommonFiles/text_form_field.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset('assets/lottie/create_password.json',repeat: false),
              SizedBox(height: 10.0.h),
              Text(
                '${AppStrings.create} ${AppStrings.newLabel} ${AppStrings.password}',
                style: MyTextStyle.poppinsExtraBoldTextStyle.copyWith(
                  letterSpacing: 0,
                  fontSize: AppDouble.double22.sp,
                ),
              ),
              SizedBox(height: 18.0.h),
              MyTextFormField(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDouble.double8).r,
                ),
                prefixIcon: const Icon(Iconsax.lock),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                label: AppStrings.enterPassword,
              ),
              SizedBox(height: 15.0.h),
              MyTextFormField(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDouble.double8).r,
                ),
                prefixIcon: const Icon(Iconsax.lock),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                label: AppStrings.enterConfirmPassword,
              ),
              SizedBox(height: 30.0.h),
              MyButton(
                title: '${AppStrings.update} ${AppStrings.password}',
                fontSize: 14.sp,
                onTap: () => MyBottomSheet.myBottomSheet(
                  title: AppStrings.passwordUpdatedSuccessfully,
                  buttonText: AppStrings.backToLogin,
                  onTap: () => Get.offAllNamed(Routes.loginScreen),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
