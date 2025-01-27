import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:shopeymart/UI/Favorite/Ctrl/favorite_ctrl.dart';

class CategoriesAllItems extends StatefulWidget {
  const CategoriesAllItems({super.key});

  @override
  State<CategoriesAllItems> createState() => _CategoriesAllItemsState();
}

class _CategoriesAllItemsState extends State<CategoriesAllItems> {
  final categoriesCtrl = Get.put(CategoriesCtrl());
  final favoriteCtrl = Get.put(FavoriteCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Get.parameters['appBarTitle']!)),
        body: Obx(
          () => Column(
            children: [
              /// Sub Categories
              SizedBox(height: AppDouble.double8.h),
              categoriesCtrl.subcategoryModel.value == null
                  ? const CircularProgressIndicator()
                  : categoriesCtrl.subcategoryModel.value!.data.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SeeMoreTile(
                              title: AppStrings.subCategories,
                              isMore: false,
                            ),
                            SizedBox(height: AppDouble.double8.h),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    categoriesCtrl
                                        .subcategoryModel.value!.data.length,
                                    (index) => Padding(
                                      padding:
                                          MyPadding.symmetricEdgeInsetsH4V6,
                                      child: GestureDetector(
                                        onTap: () {
                                          categoriesCtrl
                                                  .takingCategoriesAllItemsAppBarTitle
                                                  .value =
                                              categoriesCtrl
                                                  .subcategoryModel
                                                  .value!
                                                  .data[index]
                                                  .subcategoryName;
                                          categoriesCtrl.update();
                                          categoriesCtrl
                                              .getSubCategoryInerProducts(
                                            categoryByProductId: categoriesCtrl
                                                .subcategoryModel
                                                .value!
                                                .data[index]
                                                .id,
                                          );
                                          // categoriesCtrl
                                          //     .getSubCategoryByProducts(
                                          //   subCategoryByProductId:
                                          //       categoriesCtrl.categoriesModel
                                          //           .value!.data[index].id,
                                          // );
                                          Get.toNamed(
                                              Routes.subCategoryProductScreen,
                                              parameters: {
                                                'appBarTitle': categoriesCtrl
                                                    .subcategoryModel
                                                    .value!
                                                    .data[index]
                                                    .subcategoryName,
                                              });
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: AppDouble.double60.r,
                                              width: AppDouble.double60.r,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    categoriesCtrl
                                                        .subcategoryModel
                                                        .value!
                                                        .data[index]
                                                        .images,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 80.w,
                                              child: Text(
                                                  categoriesCtrl
                                                      .subcategoryModel
                                                      .value!
                                                      .data[index]
                                                      .subcategoryName,
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
                                  categoriesCtrl.subcategoryModel.value!.data
                                              .length >
                                          8
                                      ? GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            AppStrings.viewAll,
                                            style: MyTextStyle
                                                .poppinsRegularTextStyleF13
                                                .copyWith(
                                              fontSize: AppDouble.double12.sp,
                                              color: MyColors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),

              categoriesCtrl.categoriesByProductsModel.value != null
                  ? categoriesCtrl.categoriesByProductsModel.value!.data.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.notFound,
                                  style: MyTextStyle.poppinsRegularTextStyleF13
                                      .copyWith(
                                    fontSize: AppDouble.double12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      :

                      /// Grid View Products
                      Expanded(
                          child: ResponsiveGridList(
                            horizontalGridSpacing:
                                0, // Horizontal space between grid items
                            verticalGridSpacing:
                                0, // Vertical space between grid items
                            horizontalGridMargin:
                                0, // Horizontal space around the grid
                            verticalGridMargin:
                                0, // Vertical space around the grid
                            minItemWidth: 300
                                .w, // The minimum item width (can be smaller, if the layout constraints are smaller)
                            minItemsPerRow:
                                2, // The minimum items to show in a single row. Takes precedence over minItemWidth
                            children: List.generate(
                              categoriesCtrl
                                  .categoriesByProductsModel.value!.data.length,
                              (index) => CartDesignWidget(
                                maxStockWarranty: 80,
                                minStockWarranty: 79,
                                discount: categoriesCtrl
                                    .categoriesByProductsModel
                                    .value!
                                    .data[index]
                                    .offerDiscount
                                    .toString(),
                                isLimitedTimeDeal: false,

                                isFavourite: categoriesCtrl
                                    .categoriesByProductsModel
                                    .value!
                                    .data[index]
                                    .isInWishlist,
                                isFavouriteLoad:
                                    favoriteCtrl.favoriteIndex.value == index
                                        ? favoriteCtrl
                                            .apiController.isLoading.value
                                        : false,
                                // isBestSeller: true,
                                onTapFavourite: () {
                                  // Useing favorit index
                                  favoriteCtrl.favoriteIndex.value = index;

                                  categoriesCtrl.update();
                                  favoriteCtrl.favoritePostDelete(
                                    index: index,
                                    isFavourite: categoriesCtrl
                                        .categoriesByProductsModel
                                        .value!
                                        .data[index]
                                        .isInWishlist,
                                    productId: categoriesCtrl
                                        .categoriesByProductsModel
                                        .value!
                                        .data[index]
                                        .id,
                                  );
                                },
                                isTopSeller: true,
                                discountType: categoriesCtrl
                                    .categoriesByProductsModel
                                    .value!
                                    .data[index]
                                    .offerDiscountType,
                                imageUrl: categoriesCtrl
                                    .categoriesByProductsModel
                                    .value!
                                    .data[index]
                                    .variants
                                    .first
                                    .images
                                    .first,
                                isFreeDelivery: categoriesCtrl
                                        .categoriesByProductsModel
                                        .value!
                                        .data[index]
                                        .shippingFeeType ==
                                    'Free Shipping',
                                price: categoriesCtrl.categoriesByProductsModel
                                    .value!.data[index].variants.first.price
                                    .toString(),
                                discountPrice: categoriesCtrl
                                    .categoriesByProductsModel
                                    .value!
                                    .data[index]
                                    .variants
                                    .first
                                    .sellingPrice
                                    .toString(),
                                productName: categoriesCtrl
                                    .categoriesByProductsModel
                                    .value!
                                    .data[index]
                                    .productName,
                              ),
                            ), // The list of widgets in the list
                          ),
                        )
                  : const Center(
                      child: CircularProgressIndicator(),
                    )
            ],
          ),
        ));
  }
}
