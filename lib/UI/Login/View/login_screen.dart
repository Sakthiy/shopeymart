import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/text_form_field.dart';
import 'package:shopeymart/FirebaseCore/google_sign_in_ctrl.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: GetBuilder(
            init: GoogleSignInCtrl(),
            builder: (googleSignInCtrl) => Padding(
              padding: const EdgeInsets.all(18.0),
              child: SingleChildScrollView(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Lottie.asset(
                    //     'assets/lottie/login.json',
                    //     height: AppDouble.double180.h,
                    //   ),
                    // ),
                    SizedBox(height: AppDouble.double5.h),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/shopey_mart.jpeg',
                        scale: 1.9,
                      ),
                    ),
                    SizedBox(height: AppDouble.double5.h),
                    Text(
                      AppStrings.loginToShopeyMart,
                      style: MyTextStyle.poppinsSemiBoldTextStyleF15.copyWith(
                        fontSize: 24.sp,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: AppDouble.double5.h),
                    Text(
                      AppStrings.shopSlogan,
                      textAlign: TextAlign.center,
                      style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                        fontSize: 14.sp,
                        color: MyColors.greyColor,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: AppDouble.double20.h),
                    MyTextFormField(
                      prefixIcon: const Icon(Iconsax.sms),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDouble.double8).r,
                      ),
                      hintText: AppStrings.emailId,
                    ),
                    SizedBox(height: AppDouble.double20.h),
                    MyTextFormField(
                      prefixIcon: const Icon(Iconsax.lock),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDouble.double8).r,
                      ),
                      hintText: AppStrings.password,
                    ),
                    SizedBox(height: AppDouble.double10.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () => Get.toNamed(Routes.forgotPasswordScreen),
                        child: Text(
                          AppStrings.forgetPassword,
                          style:
                              MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppDouble.double20.h),
                    MyButton(title: AppStrings.login),
                    SizedBox(height: AppDouble.double20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.donHaveAnAccountYet,
                          style:
                              MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: AppDouble.double5.h),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.signupScreen),
                          child: Text(
                            AppStrings.signup,
                            style:
                                MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                              color: MyColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppDouble.double20.h),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(thickness: 1, endIndent: 15)),
                        Text(
                          AppStrings.or,
                          style:
                              MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                            color: MyColors.greyColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Expanded(
                            child: Divider(thickness: 1, indent: 15)),
                      ],
                    ),
                    SizedBox(height: AppDouble.double20.h),
                    StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.somethingWentWrong),
                                Text(snapshot.error.toString()),
                              ],
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return Center(child: Text(AppStrings.alreadyLogin));
                        } else {
                          return MyButton(
                            onTap: () => googleSignInCtrl.googleLogin(),
                            title: AppStrings.loginWithGoogle,
                            screenWithDivider: 7,
                            image: 'assets/images/svg/google.svg',
                            borderColor: MyColors.greyColor,
                            containerColor: MyColors.lightPrimaryColor,
                            textColor: MyColors.blackColor,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
