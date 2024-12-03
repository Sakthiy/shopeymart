import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopeymart/UI/Home/View/home_screen.dart';
import 'package:shopeymart/UI/Menu/menu_screen.dart';

class DashBoardCtrl extends GetxController {

  RxInt bottomCurrentIndex = 0.obs;
  DateTime? currentBackPressTime;

    RxList<Widget> screensList = [
      HomeScreen(),
      const Center(child: Text('Category')),
      const Center(child: Text('Orders')),
      const MenuScreen(),
    ].obs;
}