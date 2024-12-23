import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget_small.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesAllItems extends StatefulWidget {
  const CategoriesAllItems({super.key});

  @override
  State<CategoriesAllItems> createState() => _CategoriesAllItemsState();
}

class _CategoriesAllItemsState extends State<CategoriesAllItems> {
  @override
  void initState() {
    // TODO: implement initState
    loader();
    super.initState();
  }

  bool isLoad = true;

  Future<bool> loader() async {
    await Future.delayed(const Duration(seconds: 2), () {
      isLoad = false;
      setState(() {});
    });
    return isLoad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Get.parameters['appBarTitle']!),
        ),
        body: GetBuilder(
          init: CategoriesCtrl(),
          builder: (categoriesCtrl) => Skeletonizer(
            enabled: isLoad,
            ignoreContainers: true,
            ignorePointers: true,
            enableSwitchAnimation: true,
            child: Column(
              children: [
                /// Sub Categories
                SizedBox(height: AppDouble.double8.h),
                categoriesCtrl
                        .categoriesResp
                        .value!
                        .categories[categoriesCtrl.categoriesCurrentIndex.value]
                        .subCategories!
                        .isNotEmpty
                    ? Column(
                        children: [
                          SeeMoreTile(
                            title: AppStrings.subCategories,
                            isMore: false,
                          ),
                          SizedBox(height: AppDouble.double8.h),
                          SingleChildScrollView(
                            controller: categoriesCtrl.scrollSubCategoriesCtrl,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: MyPadding.symmetricEdgeInsetsH4V6,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (categoriesCtrl
                                              .isSubCategoriesSelected.value ==
                                          false) {
                                        categoriesCtrl.isSubCategoriesSelected
                                            .value = true;
                                        categoriesCtrl.update();
                                      }
                                    },
                                    child: Container(
                                      padding:
                                          MyPadding.symmetricEdgeInsetsH18V8,
                                      decoration: BoxDecoration(
                                        color: categoriesCtrl
                                                .isSubCategoriesSelected.value
                                            ? MyColors.primaryColor
                                                .withOpacity(.2)
                                            : null,
                                        borderRadius: BorderRadius.circular(
                                                AppDouble.double5)
                                            .r,
                                      ),
                                      child: Text(AppStrings.all,
                                          style: MyTextStyle
                                              .poppinsRegularTextStyleF13
                                              .copyWith(
                                                  fontSize:
                                                      AppDouble.double18.sp,
                                                  fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                ...List.generate(
                                  categoriesCtrl
                                      .categoriesResp.value!.categories.length,
                                  (index) => Padding(
                                    padding: MyPadding.symmetricEdgeInsetsH4V6,
                                    child: GestureDetector(
                                      // onTap: () {
                                      //   categoriesCtrl.update();
                                      // },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: AppDouble.double60.r,
                                            width: AppDouble.double60.r,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: categoriesCtrl
                                                            .subCategoriesCurrentIndex
                                                            .value ==
                                                        index
                                                    ? MyColors.primaryColor
                                                    : MyColors.whiteColor,
                                                width: categoriesCtrl
                                                            .subCategoriesCurrentIndex
                                                            .value ==
                                                        index
                                                    ? 3
                                                    : 0,
                                              ),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                  categoriesCtrl
                                                      .categoriesResp
                                                      .value!
                                                      .categories[index]
                                                      .imageUrl,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 80.w,
                                            child: Text(
                                                categoriesCtrl
                                                    .categoriesResp
                                                    .value!
                                                    .categories[categoriesCtrl
                                                        .categoriesCurrentIndex
                                                        .value]
                                                    .subCategories![index]
                                                    .name,
                                                textAlign: TextAlign.center,
                                                style: MyTextStyle
                                                    .poppinsRegularTextStyleF13
                                                    .copyWith(
                                                  fontSize: 12.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),

                /// Grid View Products
                Expanded(
                  child: ResponsiveGridList(
                    horizontalGridSpacing:
                        0, // Horizontal space between grid items
                    verticalGridSpacing: 0, // Vertical space between grid items
                    horizontalGridMargin: 0, // Horizontal space around the grid
                    verticalGridMargin: 0, // Vertical space around the grid
                    minItemWidth: 300
                        .w, // The minimum item width (can be smaller, if the layout constraints are smaller)
                    minItemsPerRow:
                        2, // The minimum items to show in a single row. Takes precedence over minItemWidth
                    // maxItemsPerRow: 5, // The maximum items to show in a single row. Can be useful on large screens
                    // listViewBuilderOptions: ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function
                    children: List.generate(
                      8,
                      (index) => const CartDesignWidget(
                        maxStockWarranty: 80,
                        minStockWarranty: 79,
                        discount: '69',
                        isLimitedTimeDeal: true,
                        isFavourite: true,
                        // isBestSeller: true,
                        isTopSeller: true,
                        discountType: 'percent',
                        imageUrl:
                            'https://m.media-amazon.com/images/I/61FVOB9ty-L._SY879_.jpg',
                        isFreeDelivery: true,
                        price: '800',
                        productName:
                            """OM SAI LATEST CREATION Soft Cotton & Silk Saree for Women Banarasi Saree Under 399 2021 Beautiful for Women Saree""",
                      ),
                    ), // The list of widgets in the list
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
