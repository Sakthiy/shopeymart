import 'dart:async';
import 'package:get/get.dart';
import 'package:shopeymart/FirebaseCore/auth_controller.dart';
import 'package:shopeymart/UI/Login/Ctrl/login_ctrl.dart';

class SplashScreenCtrl extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () {
        // Get.put(AuthController()).initialized;
        Get.put(LoginCtrl()).initialized;
      },
    );
    super.onInit();
  }
}
