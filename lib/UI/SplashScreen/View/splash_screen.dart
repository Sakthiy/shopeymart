import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/Theme/Ctrl/theme_ctrl.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_text_style.dart';
import 'package:shopeymart/UI/SplashScreen/Ctrl/splash_screen_ctrl.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myMaterialColor(MyColors.primaryColor),
      body: GetBuilder(
        init: SplashScreenCtrl(),
        builder: (splashScreenCtrl) => Center(
          child: Text(
            AppStrings.appName,
            style: MyTextStyle.myTextStyle.copyWith(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
