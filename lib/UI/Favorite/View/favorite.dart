import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
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
    favoriteCtrl.getFavoriteProductes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => favoriteCtrl.favoriteProductsModel.value == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : favoriteCtrl.favoriteProductsModel.value!.wishlist.isEmpty
              ? Center(
                  child: Text(AppStrings.notFound),
                )
              : ResponsiveGridList(
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
    ));
  }
}
