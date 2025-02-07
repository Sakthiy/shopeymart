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
import 'package:shopeymart/UI/ProductsDetails/Ctrl/product_details_ctrl.dart';
import 'package:shopeymart/UI/ProductsDetails/Model/product_model.dart';

class CategoriesProducts extends StatefulWidget {
  const CategoriesProducts({super.key});

  @override
  State<CategoriesProducts> createState() => _CategoriesProductsState();
}

class _CategoriesProductsState extends State<CategoriesProducts> {
  final categoriesCtrl = Get.put(CategoriesCtrl());
  final favoriteCtrl = Get.put(FavoriteCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(Get.parameters['appBarTitle']!)),
        appBar: AppBar(
            title: Obx(
          () => Text(categoriesCtrl.takingCategoriesAllItemsAppBarTitle.value),
        )),
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
                                        onTap: () async {
                                          categoriesCtrl
                                                  .takingSubCategoriesAppBarTitle
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
                                          bool result = await Get.toNamed(
                                              Routes.subCategoryProductScreen);
                                          if (result) {
                                            categoriesCtrl
                                                .getCategoryByProducts(
                                              categoryByProductId:
                                                  categoriesCtrl
                                                      .takingCategoriesId.value,
                                            );
                                          }
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
                              (index) => GestureDetector(
                                onTap: () async {
                                  bool result = await Get.toNamed(
                                      Routes.productDetailsScreen,
                                      parameters: {
                                        "productId": categoriesCtrl
                                            .categoriesByProductsModel
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
                                      .categoriesByProductsModel
                                      .value!
                                      .data[index]
                                      .variants
                                      .first
                                      .stock,
                                  isStockWarning: categoriesCtrl
                                          .categoriesByProductsModel
                                          .value!
                                          .data[index]
                                          .variants
                                          .first
                                          .stock <
                                      categoriesCtrl.categoriesByProductsModel
                                          .value!.data[index].minStockWarning,
                                  discount: categoriesCtrl
                                      .categoriesByProductsModel
                                      .value!
                                      .data[index]
                                      .offerDiscount
                                      .toString(),
                                  // isLimitedTimeDeal: true,

                                  isFavourite: categoriesCtrl
                                      .categoriesByProductsModel
                                      .value!
                                      .data[index]
                                      .isInWishlist,
                                  isFavouriteLoad: categoriesCtrl
                                      .categoriesByProductsModel
                                      .value!
                                      .data[index]
                                      .isInWishlistindex,
                                  // isBestSeller: true,
                                  onTapFavourite: () async {
                                    favoriteCtrl.categoriesCtrl
                                        .addRemovFavouriteCategories(
                                            index: index);
                                    setState(() {
                                      categoriesCtrl
                                          .categoriesByProductsModel
                                          .value!
                                          .data[index]
                                          .isInWishlistindex = true;
                                    });
                                    favoriteCtrl
                                            .categoriesCtrl
                                            .categoriesByProductsModel
                                            .value!
                                            .data[index]
                                            .isInWishlist
                                        ? favoriteCtrl.favoritePost(
                                            productId: categoriesCtrl
                                                .categoriesByProductsModel
                                                .value!
                                                .data[index]
                                                .id)
                                        : favoriteCtrl.favoriteDelete(
                                            productId: categoriesCtrl
                                                .categoriesByProductsModel
                                                .value!
                                                .data[index]
                                                .id);
                                    await Future.delayed(
                                        const Duration(seconds: 2));

                                    setState(() {
                                      categoriesCtrl
                                          .categoriesByProductsModel
                                          .value!
                                          .data[index]
                                          .isInWishlistindex = false;
                                    });
                                  },

                                  // isTopSeller: true,
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
                                  price: categoriesCtrl
                                      .categoriesByProductsModel
                                      .value!
                                      .data[index]
                                      .variants
                                      .first
                                      .price
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
