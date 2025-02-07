import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Categories/Ctrl/categories_ctrl.dart';
import 'package:shopeymart/UI/Favorite/Ctrl/favorite_ctrl.dart';

class SubCategoryProductScreen extends StatefulWidget {
  const SubCategoryProductScreen({super.key});

  @override
  State<SubCategoryProductScreen> createState() =>
      _SubCategoryProductScreenState();
}

class _SubCategoryProductScreenState extends State<SubCategoryProductScreen> {
  final categoriesCtrl = Get.put(CategoriesCtrl());
  final favoriteCtrl = Get.put(FavoriteCtrl());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: true);
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Get.back(result: true),
                icon: const Icon(Icons.arrow_back)),
            title: Obx(
              () => Text(categoriesCtrl.takingSubCategoriesAppBarTitle.value),
            ),
          ),
          body: Obx(
            () => Center(
              child: categoriesCtrl.subCategoriesInerProductsModel.value == null
                  ? const CircularProgressIndicator()
                  : categoriesCtrl.subCategoriesInerProductsModel.value != null
                      ? categoriesCtrl.subCategoriesInerProductsModel.value!
                              .data.isEmpty
                          ? Text(
                              AppStrings.notFound,
                              textAlign: TextAlign.center,
                              style: MyTextStyle.poppinsRegularTextStyleF13
                                  .copyWith(
                                fontSize: AppDouble.double12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          :

                          /// Grid View Products
                          ResponsiveGridList(
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
                              // maxItemsPerRow: 5, // The maximum items to show in a single row. Can be useful on large screens
                              // listViewBuilderOptions: ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function
                              children: List.generate(
                                categoriesCtrl.subCategoriesInerProductsModel
                                    .value!.data.length,
                                (index) => GestureDetector(
                                  onTap: () async {
                                    bool result = await Get.toNamed(
                                        Routes.productDetailsScreen,
                                        parameters: {
                                          "productId": categoriesCtrl
                                              .subCategoriesInerProductsModel
                                              .value!
                                              .data[index]
                                              .id
                                        });

                                    if (result) {
                                      categoriesCtrl.getCategoryByProducts(
                                        categoryByProductId: categoriesCtrl
                                            .takingCategoriesId.value,
                                      );
                                    }
                                  },
                                  child: CartDesignWidget(
                                    minStockWarranty: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .variants
                                        .first
                                        .stock,
                                    isStockWarning: categoriesCtrl
                                            .subCategoriesInerProductsModel
                                            .value!
                                            .data[index]
                                            .variants
                                            .first
                                            .stock <
                                        categoriesCtrl
                                            .subCategoriesInerProductsModel
                                            .value!
                                            .data[index]
                                            .minStockWarning,
                                    discount: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .offerDiscount
                                        .toString(),
                                    isLimitedTimeDeal: false,
                                    isFavourite: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .isInWishlist,
                                    isFavouriteLoad: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .isInWishlistindex,
                                    onTapFavourite: () async {
                                      favoriteCtrl.categoriesCtrl
                                          .addRemovFavouriteSubCategories(
                                              index: index);
                                      setState(() {
                                        categoriesCtrl
                                            .subCategoriesInerProductsModel
                                            .value!
                                            .data[index]
                                            .isInWishlistindex = true;
                                      });
                                      favoriteCtrl
                                              .categoriesCtrl
                                              .subCategoriesInerProductsModel
                                              .value!
                                              .data[index]
                                              .isInWishlist
                                          ? favoriteCtrl.favoritePost(
                                              productId: categoriesCtrl
                                                  .subCategoriesInerProductsModel
                                                  .value!
                                                  .data[index]
                                                  .id)
                                          : favoriteCtrl.favoriteDelete(
                                              productId: categoriesCtrl
                                                  .subCategoriesInerProductsModel
                                                  .value!
                                                  .data[index]
                                                  .id);
                                      await Future.delayed(
                                          const Duration(seconds: 2));
                                      setState(() {
                                        categoriesCtrl
                                            .subCategoriesInerProductsModel
                                            .value!
                                            .data[index]
                                            .isInWishlistindex = false;
                                      });
                                    },

                                    // isBestSeller: true,
                                    // isTopSeller: true,
                                    discountType: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .offerDiscountType,
                                    imageUrl: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .variants
                                        .first
                                        .images
                                        .first,
                                    isFreeDelivery: categoriesCtrl
                                            .subCategoriesInerProductsModel
                                            .value!
                                            .data
                                            .first
                                            .shippingFeeType ==
                                        'Free Shipping',
                                    price: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .variants
                                        .first
                                        .price
                                        .toString(),
                                    discountPrice: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .variants
                                        .first
                                        .sellingPrice
                                        .toString(),
                                    productName: categoriesCtrl
                                        .subCategoriesInerProductsModel
                                        .value!
                                        .data[index]
                                        .productName,
                                  ),
                                ),
                              ), // The list of widgets in the list
                            )
                      : const Center(child: CircularProgressIndicator()),
            ),
          )),
    );
  }
}
