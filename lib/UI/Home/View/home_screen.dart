import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/banner_images.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget_small.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:shopeymart/UI/Dashboard/Ctrl/dash_board_ctrl.dart';
import 'package:shopeymart/UI/Home/Ctrl/home_ctrl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final categoriesCtrl = Get.put(CategoriesCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              // BannerImages(
              //   bannerImageList: homeCtrl.bannerImage.value,
              //   height: AppDouble.double180.h,
              //   indicatorDownPadding: AppDouble.double30.r,
              //   viewportFraction: 1,
              //   isVibration: true,
              //   imageRadius: 0,
              //   imageHorizontalPadding: 0,
              // ),

              Skeletonizer(
                enabled: categoriesCtrl.categoriesModel.value == null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SeeMoreTile(
                        title: AppStrings.exploreCategories,
                        icon: const SizedBox(),
                        onPressed: () {
                          Get.put(DashBoardCtrl()).bottomCurrentIndex.value = 1;
                        }),
                    categoriesCtrl.categoriesModel.value != null
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(
                                categoriesCtrl
                                    .categoriesModel.value!.data.length,
                                (index) => Padding(
                                  padding: MyPadding.symmetricEdgeInsetsH4V6,
                                  child: GestureDetector(
                                    onTap: () {
                                      categoriesCtrl
                                              .takingCategoriesAllItemsAppBarTitle
                                              .value =
                                          categoriesCtrl.categoriesModel.value!
                                              .data[index].categoryName;
                                      categoriesCtrl.takingCategoriesId.value =
                                          categoriesCtrl.categoriesModel.value!
                                              .data[index].id;
                                      categoriesCtrl.update();
                                      categoriesCtrl.getCategoryByProducts(
                                        categoryByProductId: categoriesCtrl
                                            .categoriesModel
                                            .value!
                                            .data[index]
                                            .id,
                                      );
                                      categoriesCtrl.getSubCategoryByProducts(
                                        subCategoryByProductId: categoriesCtrl
                                            .categoriesModel
                                            .value!
                                            .data[index]
                                            .id,
                                      );
                                      Get.toNamed(Routes.categoriesAllItems,
                                          parameters: {
                                            'appBarTitle': categoriesCtrl
                                                .categoriesModel
                                                .value!
                                                .data[index]
                                                .categoryName,
                                          });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: AppDouble.double50.r,
                                          width: AppDouble.double50.r,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: CachedNetworkImageProvider(
                                                categoriesCtrl.categoriesModel
                                                    .value!.data[index].image,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 80.w,
                                          child: Text(
                                              categoriesCtrl
                                                  .categoriesModel
                                                  .value!
                                                  .data[index]
                                                  .categoryName,
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
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),

              // const SeeMoreTile(
              //   title: 'Offer Products',
              //   icon: SizedBox(),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Skeletonizer(
              //     enabled: false,
              //     ignoreContainers: true,
              //     ignorePointers: true,
              //     enableSwitchAnimation: true,
              //     child: Row(children: [
              //       ...List.generate(
              //         8,
              //         (index) => GestureDetector(
              //           // onTap: () => Get.toNamed(Routes.paymentScreen),
              //           onTap: () => Get.toNamed(Routes.productDetailsScreen),
              //           child: const CartDesignWidgetSmall(
              //             maxStockWarranty: 80,
              //             minStockWarranty: 79,
              //             discount: '69',
              //             isLimitedTimeDeal: true,
              //             isFavourite: true,
              //             // isBestSeller: true,
              //             isTopSeller: true,
              //             discountType: 'percent',
              //             imageUrl:
              //                 'https://m.media-amazon.com/images/I/61FVOB9ty-L._SY879_.jpg',
              //             isFreeDelivery: true,
              //             price: '800',
              //             productName:
              //                 """OM SAI LATEST CREATION Soft Cotton & Silk Saree for Women Banarasi Saree Under 399 2021 Beautiful for Women Saree""",
              //           ),
              //         ),
              //       ),
              //     ]),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
