import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shopeymart/UI/Categories/View/categories_screen.dart';
import 'package:shopeymart/UI/Favorite/View/favorite.dart';
import 'package:shopeymart/UI/Home/View/home_screen.dart';
import 'package:shopeymart/UI/Menu/menu_screen.dart';

class DashBoardCtrl extends GetxController {

  RxInt bottomCurrentIndex = 0.obs;
  DateTime? currentBackPressTime;

    RxList<Widget> screensList = [
      const HomeScreen(),
      const CategoriesScreen(),
      const FavoriteScreen(),
      const MenuScreen(),
    ].obs;
}