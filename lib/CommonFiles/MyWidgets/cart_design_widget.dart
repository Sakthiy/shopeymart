import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/my_image.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/image_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';

class CartDesignWidget extends StatelessWidget {
  const CartDesignWidget({
    super.key,
    this.isFavourite = false,
    required this.imageUrl,
    required this.isFreeDelivery,
    required this.productName,
    required this.price,
    this.discountPrice,
    required this.discountType,
    this.discount,
    this.isTopSeller = false,
    this.isBestSeller = false,
    this.minStockWarranty,
    this.maxStockWarranty,
    this.isLimitedTimeDeal = false,
  });

  final bool isFavourite;
  final bool isFreeDelivery;
  final bool? isLimitedTimeDeal;
  final String imageUrl;
  final bool? isTopSeller;
  final bool? isBestSeller;
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            child: Padding(
              padding: MyPadding.edgeInsets8.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Product Image
                  Stack(
                    children: [
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

                      /// Favourite Section
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          isFavourite
                              ? ImageStrings.redHeart
                              : ImageStrings.heart,
                          height: AppDouble.double25.h,
                          width: AppDouble.double25.w,
                        ),
                      ),

                      /// Top Seller & Best Seller Label
                      Column(
                        children: [
                          isTopSeller != null
                              ? isTopSeller!
                              ? Container(
                            padding: MyPadding.horizontalEdgeInsets6,
                            decoration: BoxDecoration(
                              color: MyColors.redColor,
                              borderRadius: BorderRadius.circular(
                                AppDouble.double3.r,
                              ),
                            ),
                            child: Text(
                              AppStrings.topSeller.toUpperCase(),
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
                              : const SizedBox()
                              : const SizedBox(),
                          isTopSeller != null
                              ? isTopSeller!
                              ? SizedBox(height: AppDouble.double4.h)
                              : const SizedBox()
                              : const SizedBox(),
                          isBestSeller != null
                              ? isBestSeller!
                              ? Container(
                            padding: MyPadding.horizontalEdgeInsets6,
                            decoration: BoxDecoration(
                              color: MyColors.redColor,
                              borderRadius: BorderRadius.circular(
                                AppDouble.double3.r,
                              ),
                            ),
                            child: Text(
                              AppStrings.bestSeller.toUpperCase(),
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
                              : const SizedBox()
                              : const SizedBox(),
                        ],
                      ),

                      /// Product Rating
                      Positioned(
                        bottom: 0,
                        child: Container(
                          padding: MyPadding.symmetricEdgeInsetsH2V1,
                          decoration: BoxDecoration(
                            color: MyColors.greenColor,
                            borderRadius:
                            BorderRadius.circular(AppDouble.double3),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '4.8',
                                style: MyTextStyle.poppinsRegularTextStyleF13
                                    .copyWith(
                                  fontSize: AppDouble.double10.sp,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                              SizedBox(width: AppDouble.double1.w),
                              Icon(
                                Icons.star_rate,
                                size: 14,
                                color: MyColors.whiteColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppDouble.double6.h),

                  /// Product Contents
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Product Name
                      Text(
                        productName,
                        style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                          fontSize: AppDouble.double11.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppDouble.double3.h),
                      ///Product Prices
                      Wrap(
                        // crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          /// Product Discount Price
                          discountPrice != null ||
                              discountPrice != '' ||
                              discountPrice != '0'
                              ? Text(
                            price,
                            style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                .copyWith(
                              letterSpacing: 0,
                              color: MyColors.greyColor,
                              fontSize: AppDouble.double13.sp,
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
                              fontSize: AppDouble.double13.sp,
                            ),
                          ),
                          SizedBox(width: AppDouble.double4.w),
                        ],
                      ),

                      /// Product Offers Section
                      discountType != null
                          ? discount != null ||
                          discount != '0' ||
                          discount != ''
                          ? Row(
                        children: [
                          Icon(
                            Icons.arrow_downward_outlined,
                            size: AppDouble.double14,
                            color: MyColors.greenColor,
                          ),
                          Text(
                            discountType == 'percent'
                                ? '$discount% Off'
                                : '-$discount Flat',
                            style: MyTextStyle
                                .poppinsRegularTextStyleF13
                                .copyWith(
                              color: MyColors.greenColor,
                              fontSize: AppDouble.double11.sp,
                            ),
                          ),
                        ],
                      )
                          : const SizedBox()
                          : const SizedBox(),
                      SizedBox(height: AppDouble.double3.h),
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
                      SizedBox(height: AppDouble.double3.h),
                      Row(
                        children: [
                          isFreeDelivery
                              ? Text(
                            AppStrings.freeDelivery,
                            style: MyTextStyle.poppinsRegularTextStyleF13
                                .copyWith(
                              letterSpacing: 0,
                              fontSize: AppDouble.double10.sp,
                            ),
                          )
                              : const SizedBox(),
                          SizedBox(width: AppDouble.double6.w),
                          minStockWarranty! < maxStockWarranty!
                              ? Text(
                            '$minStockWarranty ${AppStrings.onlyLeft}',
                            style: MyTextStyle.poppinsRegularTextStyleF13
                                .copyWith(
                              letterSpacing: 0,
                              fontSize: AppDouble.double10.sp,
                              color: MyColors.redColor,
                            ),
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
    );
  }
}