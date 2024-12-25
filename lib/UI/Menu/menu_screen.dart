import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/FirebaseCore/auth_controller.dart';
import 'package:shopeymart/FirebaseCore/google_sign_in_ctrl.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => Get.toNamed(Routes.settingsScreen),
          title: Text(AppStrings.settings),
        ),
        // ListTile(
        //   onTap: () => Get.toNamed(Routes.loginScreen),
        //   title: Text(AppStrings.login),
        // ),
        GestureDetector(
          onTap: () {
            MyBottomSheet.myLoader();
            Get.put(GoogleSignInCtrl()).googleLogOut();
            Get.put(AuthController()).initialized;
          },
          child: Text(AppStrings.logOut,style: MyTextStyle.poppinsExtraBoldTextStyle.copyWith(
            letterSpacing: 0,
            color: MyColors.redColor,
          ),),
        ),
      ],
    );
  }
}
