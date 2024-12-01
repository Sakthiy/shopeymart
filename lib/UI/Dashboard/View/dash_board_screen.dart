import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_numbers.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/UI/Dashboard/Ctrl/dash_board_ctrl.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
  });

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final DashBoardCtrl dashBoardCtrl = Get.put(DashBoardCtrl());
  @override
  Widget build(BuildContext context) {
    return Obx(() => PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            final now = DateTime.now();
            if (dashBoardCtrl.bottomCurrentIndex.value == 0) {
              if (dashBoardCtrl.currentBackPressTime == null ||
                  now.difference(dashBoardCtrl.currentBackPressTime!) >
                      const Duration(seconds: 2)) {
                dashBoardCtrl.currentBackPressTime = now;
                Fluttertoast.showToast(msg: 'Press back again to exit');
                return;
              } else {
                SystemNavigator.pop();
              }
            } else {
              dashBoardCtrl.bottomCurrentIndex.value = 0;
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: dashBoardCtrl
                  .screensList[dashBoardCtrl.bottomCurrentIndex.value],
            ),
            bottomNavigationBar: myBottomNavigationBar(context),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: AppDouble.double8).r,
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: MyColors.whiteColor,
                ),
              ),
            ),
          ),
        ));
  }

  NavigationBar myBottomNavigationBar(BuildContext context) {
    return NavigationBar(
        destinations: List.generate(
      dashBoardCtrl.screensList.length,
      (index) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          index == 2 ? SizedBox(width: AppDouble.double28.w) : const SizedBox(),
          GestureDetector(
            onTap: () {
              dashBoardCtrl.bottomCurrentIndex.value = index;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppDouble.double18,
                    vertical: AppDouble.double2,
                  ),
                  decoration: BoxDecoration(
                      color: dashBoardCtrl.bottomCurrentIndex.value == index
                          ? context.isDarkMode
                              ? MyColors.primaryColor
                              : MyColors.myMaterialColor(MyColors.primaryColor)
                                  .shade50
                          : null,
                      borderRadius: BorderRadius.circular(18.0)),
                  child: Icon(
                    index == 0
                        ? dashBoardCtrl.bottomCurrentIndex.value == index
                            ? Icons.home
                            : Icons.home_outlined
                        : index == 1
                            ? dashBoardCtrl.bottomCurrentIndex.value == index
                                ? Icons.grid_view_rounded
                                : Icons.grid_view_outlined
                            : index == 2
                                ? dashBoardCtrl.bottomCurrentIndex.value ==
                                        index
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded
                                // ? Icons.article
                                // : Icons.article_outlined
                                : Icons.menu_rounded,
                    size: dashBoardCtrl.bottomCurrentIndex.value == index
                        ? AppDouble.double22
                        : AppDouble.double18,
                    color: dashBoardCtrl.bottomCurrentIndex.value == index
                        ? context.isDarkMode
                            ? MyColors.whiteColor
                            : MyColors.primaryColor
                        : null,
                  ),
                ),
                Text(
                  index == 0
                      ? AppStrings.home
                      : index == 1
                          ? AppStrings.categories
                          : index == 2
                              ? AppStrings.favorite
                              : AppStrings.menu,
                  style: TextStyle(
                    color: dashBoardCtrl.bottomCurrentIndex.value == index
                        ? MyColors.primaryColor
                        : null,
                    fontSize: AppDouble.double10.sp,
                  ),
                ),
              ],
            ),
          ),
          index == 1 ? SizedBox(width: AppDouble.double28.w) : const SizedBox()
        ],
      ),
    ));
  }
}
