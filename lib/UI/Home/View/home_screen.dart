import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/banner_images.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/UI/Home/Ctrl/home_ctrl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeCtrl homeCtrl = HomeCtrl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              BannerImages(
                bannerImageList: homeCtrl.bannerImage.value,
                height: AppDouble.double180.h,
                indicatorDownPadding: AppDouble.double30.r,
                viewportFraction: 1,
                isVibration: true,
                imageRadius: 0,
                imageHorizontalPadding: 0,
              ),
              const SeeMoreTile(title: 'Offer Products'),
              SizedBox(
                height: 390,
                child: ListView.builder(
                  padding: MyPadding.horizontalEdgeInsets6.r,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) => Padding(
                    padding: MyPadding.onlyEdgeInsetsR4.r,
                    //   // 'https://m.media-amazon.com/images/I/51fGcq4f3BL._SX300_SY300_QL70_FMwebp_.jpg',
                    //   'https://m.media-amazon.com/images/I/61FVOB9ty-L._SY879_.jpg',
                    child: const CartDesignWidget(
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


