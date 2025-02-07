import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Favorite/Ctrl/favorite_ctrl.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final favoriteCtrl = Get.put(FavoriteCtrl());

  @override
  void initState() {
    favoriteCtrl.getFavoriteProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => favoriteCtrl.favoriteProductsModel.value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : favoriteCtrl.favoriteProductsModel.value!.wishlist.isEmpty
                ? Center(
                    child: Text(AppStrings.notFound),
                  )
                : Obx(
                    () => ResponsiveGridList(
                      horizontalGridSpacing:
                          0, // Horizontal space between grid items
                      verticalGridSpacing:
                          0, // Vertical space between grid items
                      horizontalGridMargin:
                          0, // Horizontal space around the grid
                      verticalGridMargin: 0, // Vertical space around the grid
                      minItemWidth: 300
                          .w, // The minimum item width (can be smaller, if the layout constraints are smaller)
                      minItemsPerRow:
                          2, // The minimum items to show in a single row. Takes precedence over minItemWidth
                      // maxItemsPerRow: 5, // The maximum items to show in a single row. Can be useful on large screens
                      // listViewBuilderOptions: ListViewBuilderOptions(), // Options that are getting passed to the ListView.builder() function
                      children: List.generate(
                        favoriteCtrl
                            .favoriteProductsModel.value!.wishlist.length,
                        (index) => GestureDetector(
                          onTap: () async {
                            bool result = await Get.toNamed(
                                Routes.productDetailsScreen,
                                parameters: {
                                  "productId": favoriteCtrl
                                      .favoriteProductsModel
                                      .value!
                                      .wishlist[index]
                                      .id
                                });
                            if (result) favoriteCtrl.getFavoriteProduct();
                          },
                          child: CartDesignWidget(
                            // stock: 80,
                            minStockWarranty: favoriteCtrl.favoriteProductsModel
                                .value!.wishlist[index].variants.first.stock,
                            isStockWarning: favoriteCtrl
                                    .favoriteProductsModel
                                    .value!
                                    .wishlist[index]
                                    .variants
                                    .first
                                    .stock <
                                favoriteCtrl.favoriteProductsModel.value!
                                    .wishlist[index].minStockWarning,
                            discount: favoriteCtrl.favoriteProductsModel.value!
                                .wishlist[index].offerDiscount
                                .toString(),
                            isLimitedTimeDeal: false,
                            isFavourite: true,
                            // isBestSeller: true,
                            // isTopSeller: true,
                            isFavouriteLoad: favoriteCtrl.favoriteProductsModel
                                .value!.wishlist[index].isWishlistindexLoader,
                            onTapFavourite: () async {
                              favoriteCtrl.favoriteProductsModel.value!
                                  .wishlist[index].isWishlistindexLoader = true;
                              setState(() {});
                              favoriteCtrl.unFavorite(
                                  productId: favoriteCtrl.favoriteProductsModel
                                      .value!.wishlist[index].id);
                              await Future.delayed(const Duration(seconds: 2));
                              favoriteCtrl
                                  .favoriteProductsModel
                                  .value!
                                  .wishlist[index]
                                  .isWishlistindexLoader = false;
                              setState(() {});
                            },
                            discountType: favoriteCtrl.favoriteProductsModel
                                .value!.wishlist[index].offerDiscountType,
                            imageUrl: favoriteCtrl.favoriteProductsModel.value!
                                .wishlist[index].productThumbnailPath,
                            isFreeDelivery: favoriteCtrl.favoriteProductsModel
                                    .value!.wishlist[index].shippingFeeType ==
                                'Free Shipping',
                            price: favoriteCtrl.favoriteProductsModel.value!
                                .wishlist[index].variants.first.price
                                .toString(),
                            discountPrice: favoriteCtrl
                                .favoriteProductsModel
                                .value!
                                .wishlist[index]
                                .variants
                                .first
                                .sellingPrice
                                .toString(),
                            productName: favoriteCtrl.favoriteProductsModel
                                .value!.wishlist[index].productName,
                          ),
                        ),
                      ), // The list of widgets in the list
                    ),
                  )));
  }
}
