import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget_small.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final categoriesCtrl = Get.put(CategoriesCtrl());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.categories),
        ),
        body: RefreshIndicator(
          onRefresh: () => categoriesCtrl.getCategoryData(),
          child: Obx(
            () => categoriesCtrl.categoriesModel.value == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Skeletonizer(
                    enabled: categoriesCtrl.categoriesModel.value == null,
                    ignoreContainers: true,
                    ignorePointers: true,
                    enableSwitchAnimation: true,
                    child: ResponsiveGridList(
                      horizontalGridSpacing: 10,
                      verticalGridSpacing: 20.r,
                      horizontalGridMargin: 0,
                      verticalGridMargin: 20.r,
                      minItemWidth: 300.w,
                      minItemsPerRow:
                          4, // The minimum items to show in a single row. Takes precedence over minItemWidth
                      // maxItemsPerRow: 5, // The maximum items to show in a single row. Can be useful on large screens
                      // listViewBuilderOptions: ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function
                      children: List.generate(
                          categoriesCtrl.categoriesModel.value!.data.length,
                          (index) {
                        if (categoriesCtrl
                                .takingCategoriesAllItemsAppBarTitle.value ==
                            '') {
                          categoriesCtrl
                                  .takingCategoriesAllItemsAppBarTitle.value =
                              categoriesCtrl.categoriesModel.value!.data[index]
                                  .categoryName;
                        }
                        return GestureDetector(
                          onTap: () {
                            categoriesCtrl.categoriesCurrentIndex.value = index;
                            categoriesCtrl
                                    .takingCategoriesAllItemsAppBarTitle.value =
                                categoriesCtrl.categoriesModel.value!.data[index]
                                    .categoryName;
                            categoriesCtrl.update();
                            Get.toNamed(Routes.categoriesAllItems, parameters: {
                              'appBarTitle': categoriesCtrl.categoriesModel
                                  .value!.data[index].categoryName,
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                height: AppDouble.double60.r,
                                width: AppDouble.double60.r,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: categoriesCtrl
                                                .categoriesCurrentIndex.value ==
                                            index
                                        ? MyColors.primaryColor
                                        : MyColors.whiteColor,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                      categoriesCtrl.categoriesModel.value!
                                          .data[index].image,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: AppDouble.double3.h),
                              Text(
                                categoriesCtrl.categoriesModel.value!.data[index]
                                    .categoryName,
                                textAlign: TextAlign.center,
                                style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                    .copyWith(
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
          ),
        ));
  }
}
