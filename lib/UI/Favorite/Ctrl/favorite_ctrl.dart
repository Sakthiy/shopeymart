import 'package:get/get.dart';

class FavoriteCtrl extends GetxController {
  RxBool isLoad = true.obs;
  Future<bool> loader() async {
    await Future.delayed(const Duration(seconds: 2), () {
      isLoad.value = false;
      update();
    });
    print(isLoad.value);
    return isLoad.value;
  }

  @override
  void onInit() {
    loader();
    super.onInit();
  }
}
