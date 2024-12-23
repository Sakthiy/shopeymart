import 'dart:async';
import 'package:get/get.dart';
import 'package:shopeymart/FirebaseCore/auth_controller.dart';

class SplashScreenCtrl extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
        ()=> Get.put(AuthController()).initialized,
    );
    super.onInit();
  }
}
