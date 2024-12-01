import 'dart:async';

import 'package:get/get.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';

class SplashScreenCtrl extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 3),
      () => Get.offAllNamed(Routes.dashBoardScreen),
    );
    super.onInit();
  }
}
