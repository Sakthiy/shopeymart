import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/my_image.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';

class CartDesignWidget extends StatefulWidget {
  const CartDesignWidget({
    super.key,
    required this.isFavourite,
    required this.imageUrl,
    required this.isFreeDelivery,
    this.isStockWarning = false,
    this.isFavouriteLoad = false,
    required this.productName,
    required this.price,
    this.discountPrice,
    required this.discountType,
    this.discount,
    this.isTopSeller = false,
    this.isBestSeller = false,
    this.isRateing = false,
    this.minStockWarranty,
    this.isLimitedTimeDeal = false,
    this.onTapFavourite,
  });

  final bool isFavourite;
  final bool isFreeDelivery;
  final bool? isLimitedTimeDeal;
  final bool? isRateing;
  final String imageUrl;
  final bool? isTopSeller;
  final bool? isBestSeller;
  final bool? isStockWarning;
  final bool isFavouriteLoad;
  final String productName;
  final String price;
  //onTapFavourite
  final GestureTapCallback? onTapFavourite;
  final String? discountPrice;
  final String? discountType;
  final String? discount;
  final int? minStockWarranty;

  @override
  State<CartDesignWidget> createState() => _CartDesignWidgetState();
}

class _CartDesignWidgetState extends State<CartDesignWidget> {
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
                          imageUrl: widget.imageUrl,
                          scale: 4,
                          fit: BoxFit.cover,
                        ),
                      ),

                      /// Favourite Section
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: widget.onTapFavourite,
                          child: Container(
                            padding: EdgeInsets.all(AppDouble.double5).r,
                            decoration: BoxDecoration(
                              color: MyColors.whiteColor.withOpacity(0.8),
                              shape: BoxShape.circle,
                            ),
                            child: widget.isFavouriteLoad
                                ? SizedBox(
                                    width: AppDouble.double20.w,
                                    height: AppDouble.double20.w,
                                    child: CircularProgressIndicator(
                                      strokeWidth: AppDouble.double3,
                                    ),
                                  )
                                : widget.isFavourite
                                    ? Icon(
                                        Iconsax.heart5,
                                        color: MyColors.redColor,
                                      )
                                    : Icon(
                                        Iconsax.heart,
                                        color: MyColors.blackColor,
                                      ),
                          ),
                        ),
                      ),

                      /// Top Seller & Best Seller Label
                      Column(
                        children: [
                          widget.isTopSeller != null
                              ? widget.isTopSeller!
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
                          widget.isTopSeller != null
                              ? widget.isTopSeller!
                                  ? SizedBox(height: AppDouble.double4.h)
                                  : const SizedBox()
                              : const SizedBox(),
                          widget.isBestSeller != null
                              ? widget.isBestSeller!
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
                      !widget.isRateing!
                          ? const SizedBox()
                          : Positioned(
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
                                      style: MyTextStyle
                                          .poppinsRegularTextStyleF13
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
                        widget.productName,
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
                          widget.discountPrice != null ||
                                  widget.discountPrice != '' ||
                                  widget.discountPrice != '0'
                              ? Text(
                                  widget.price,
                                  style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                      .copyWith(
                                    letterSpacing: 0,
                                    color: MyColors.greyColor,
                                    fontSize: AppDouble.double13.sp,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : const SizedBox(),
                          widget.discountPrice != null ||
                                  widget.discountPrice != '' ||
                                  widget.discountPrice != '0'
                              ? SizedBox(width: AppDouble.double6.w)
                              : const SizedBox(),

                          /// Product Price
                          Text(
                            widget.discountPrice == null ||
                                    widget.discountPrice == '0' ||
                                    widget.discountPrice == ''
                                ? '₹${widget.price}'
                                : '₹${widget.discountPrice}',
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
                      /// Limited Time Deal
                      widget.discountType != null
                          ? widget.discount != null ||
                                  widget.discount != '0' ||
                                  widget.discount != ''
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_downward_outlined,
                                      size: AppDouble.double14,
                                      color: MyColors.greenColor,
                                    ),
                                    Text(
                                      widget.discountType == 'Percentage'
                                          ? '${widget.discount}% Off'
                                          : '-${widget.discount} Flat',
                                      style: MyTextStyle
                                          .poppinsRegularTextStyleF13
                                          .copyWith(
                                        color: MyColors.greenColor,
                                        fontSize: AppDouble.double11.sp,
                                      ),
                                    ),
                                    SizedBox(width: AppDouble.double3.h),

                                    /// Limited Time Deal
                                    widget.isLimitedTimeDeal!
                                        ? Container(
                                            padding:
                                                MyPadding.horizontalEdgeInsets6,
                                            decoration: BoxDecoration(
                                              color: MyColors.redColor,
                                              borderRadius:
                                                  BorderRadius.circular(
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
                                )
                              : const SizedBox()
                          : const SizedBox(),

                      SizedBox(height: AppDouble.double3.h),
                      Row(
                        children: [
                          widget.isFreeDelivery
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
                          widget.isStockWarning!
                              ? Text(
                                      '${widget.minStockWarranty} ${AppStrings.onlyLeft}',
                                      style: MyTextStyle
                                          .poppinsRegularTextStyleF13
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
