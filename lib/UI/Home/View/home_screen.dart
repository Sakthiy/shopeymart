import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/banner_images.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/my_image.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/image_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
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
                height: 460,
                child: ListView.builder(
                  padding: MyPadding.horizontalEdgeInsets6.r,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) => Padding(
                    padding: MyPadding.onlyEdgeInsetsR4.r,
                    //   // 'https://m.media-amazon.com/images/I/51fGcq4f3BL._SX300_SY300_QL70_FMwebp_.jpg',
                    //                               'https://m.media-amazon.com/images/I/61FVOB9ty-L._SY879_.jpg',
                    child: const MyCartWidget(
                      maxStockWarranty: 80,
                      minStockWarranty: 79,
                      discount: '69',
                      isLimitedTimeDeal: true,
                      isFavourite: true,
                      discountType: 'percent',
                      imageUrl:
                          'https://m.media-amazon.com/images/I/61FVOB9ty-L._SY879_.jpg',
                      isFreeDelivery: true,
                      price: '8,000,00,00,00,0',
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

class MyCartWidget extends StatelessWidget {
  const MyCartWidget({
    super.key,
    this.isFavourite = false,
    required this.imageUrl,
    required this.isFreeDelivery,
    required this.productName,
    required this.price,
    this.discountPrice,
    required this.discountType,
    this.discount,
    this.topSeller,
    this.bestSeller,
    this.minStockWarranty,
    this.maxStockWarranty,
    this.isLimitedTimeDeal = false,
  });

  final bool isFavourite;
  final bool isFreeDelivery;
  final bool? isLimitedTimeDeal;
  final String imageUrl;
  final String? topSeller;
  final String? bestSeller;
  final String productName;
  final String price;
  final String? discountPrice;
  final String? discountType;
  final String? discount;
  final int? minStockWarranty;
  final int? maxStockWarranty;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDouble.double180.w,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Padding(
                  padding: MyPadding.edgeInsets8.r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// Product Image
                      Container(
                        decoration:
                            BoxDecoration(color: MyColors.lightBlueBGColor),
                        child: MyImage(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3.h,
                          imageUrl: imageUrl,
                          scale: 4,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Product Contents
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Product Name
                          Text(
                            productName,
                            style: MyTextStyle.poppinsRegularTextStyleF13,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: AppDouble.double3.h),

                          ///Product Prices
                          Wrap(
                            children: [
                              /// Product Discount Price
                              discountPrice != null ||
                                      discountPrice != '' ||
                                      discountPrice != '0'
                                  ? Text(
                                      '₹$price',
                                      style: MyTextStyle
                                          .poppinsSemiBoldTextStyleF15
                                          .copyWith(
                                        letterSpacing: 0,
                                        color: MyColors.greyColor,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    )
                                  : const SizedBox(),
                              discountPrice != null ||
                                      discountPrice != '' ||
                                      discountPrice != '0'
                                  ? SizedBox(width: AppDouble.double6.w)
                                  : const SizedBox(),

                              /// Product Price
                              Text(
                                discountPrice == null ||
                                        discountPrice == '0' ||
                                        discountPrice == ''
                                    ? '₹$price'
                                    : '₹$discountPrice',
                                style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                    .copyWith(
                                  letterSpacing: 0,
                                  fontSize: AppDouble.double18.sp,
                                ),
                              ),
                              SizedBox(width: AppDouble.double6.w),

                              /// Product Offers Section
                              discountType != null
                                  ? discount != null ||
                                          discount != '0' ||
                                          discount != ''
                                      ? Row(
                                          children: [
                                            Icon(
                                              Icons.arrow_downward_outlined,
                                              color: MyColors.greenColor,
                                            ),
                                            Text(
                                              discountType == 'percent'
                                                  ? '$discount%'
                                                  : '-$discount',
                                              style: MyTextStyle
                                                  .poppinsRegularTextStyleF13
                                                  .copyWith(
                                                color: MyColors.greenColor,
                                                fontSize: AppDouble.double13.sp,
                                              ),
                                            ),
                                          ],
                                        )
                                      : const SizedBox()
                                  : const SizedBox(),
                              SizedBox(width: AppDouble.double4.w),
                              /// Limited Time Deal
                              isLimitedTimeDeal!
                                  ? Container(
                                padding: MyPadding.horizontalEdgeInsets6,
                                decoration: BoxDecoration(
                                  color: MyColors.redColor,
                                  borderRadius: BorderRadius.circular(
                                    AppDouble.double3,
                                  ),
                                ),
                                child: Text(
                                  AppStrings.limitedTimeDeal,
                                  style: MyTextStyle
                                      .poppinsRegularTextStyleF13
                                      .copyWith(
                                    letterSpacing: 0,
                                    fontSize: AppDouble.double10.sp,
                                    color: MyColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                                  : const SizedBox(),
                            ],
                          ),
                          SizedBox(height: AppDouble.double3.h),

                          /// Product Rating
                          Row(
                            children: [
                              Icon(Icons.stars_rounded,
                                  color: MyColors.greenColor),
                              SizedBox(width: AppDouble.double3.w),
                              Text(
                                '4.8',
                                style: MyTextStyle.poppinsRegularTextStyleF13
                                    .copyWith(
                                  fontSize: AppDouble.double13.sp,
                                ),
                              ),
                              SizedBox(width: AppDouble.double4.w),
                              Text(
                                '(418)',
                                style: MyTextStyle.poppinsRegularTextStyleF13
                                    .copyWith(
                                  fontSize: AppDouble.double13.sp,
                                  color: MyColors.greyColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppDouble.double3.h),
                          Row(
                            children: [
                              isFreeDelivery
                                  ? Text(
                                      AppStrings.freeDelivery,
                                      style: MyTextStyle
                                          .poppinsRegularTextStyleF13
                                          .copyWith(letterSpacing: 0),
                                    )
                                  : const SizedBox(),
                              SizedBox(width: AppDouble.double6.w),
                              minStockWarranty! < maxStockWarranty!
                                  ? Text(
                                      '$minStockWarranty ${AppStrings.onlyLeft}',
                                      style: MyTextStyle
                                          .poppinsRegularTextStyleF13
                                          .copyWith(
                                              letterSpacing: 0,
                                              color: MyColors.redColor),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Favourite Section
          Padding(
            padding: MyPadding.edgeInsets15.r,
            child: Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                isFavourite ? ImageStrings.redHeart : ImageStrings.heart,
                height: AppDouble.double25.h,
                width: AppDouble.double25.w,
              ),
            ),
          ),

          /// Top Seller & Best Seller Label
          Padding(
            padding: MyPadding.edgeInsets10.r,
            child: Column(
              children: [
                topSeller != null || topSeller != ''
                    ? Container(
                        padding: MyPadding.horizontalEdgeInsets6,
                        decoration: BoxDecoration(
                          color: MyColors.redColor,
                          borderRadius: BorderRadius.circular(
                            AppDouble.double3,
                          ),
                        ),
                        child: Text(
                          AppStrings.topSeller.toUpperCase(),
                          style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                            letterSpacing: 0,
                            fontSize: AppDouble.double10.sp,
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(),
                topSeller != null || topSeller != ''
                    ? SizedBox(height: AppDouble.double4.h)
                    : const SizedBox(),
                bestSeller != null || bestSeller != ''
                    ? Container(
                        padding: MyPadding.horizontalEdgeInsets6,
                        decoration: BoxDecoration(
                          color: MyColors.redColor,
                          borderRadius: BorderRadius.circular(
                            AppDouble.double3,
                          ),
                        ),
                        child: Text(
                          AppStrings.bestSeller.toUpperCase(),
                          style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                            letterSpacing: 0,
                            fontSize: AppDouble.double10.sp,
                            color: MyColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
