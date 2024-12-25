import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget_small.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/my_image.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/ProductsDetails/Ctrl/product_details_ctrl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: ProductDetailsCtrl(),
          builder: (productDetailsCtrl) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      children: [
                        MyImage(
                          fit: BoxFit.cover,
                          height: AppDouble.double270.h,
                          imageUrl: productDetailsCtrl.imageList[
                              productDetailsCtrl.selectImageIndex.value],
                        ),
                        imageTopMenu(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: AppDouble.double50,
                        child: ListView.separated(
                          padding: EdgeInsets.only(left: AppDouble.double20),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              productDetailsCtrl.selectImageIndex.value = index;
                              productDetailsCtrl.update();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    productDetailsCtrl.selectImageIndex.value ==
                                            index
                                        ? Border.all(
                                            color: MyColors.primaryColor,
                                            width: AppDouble.double2,
                                          )
                                        : const Border(),
                              ),
                              child: MyImage(
                                imageUrl: productDetailsCtrl.imageList[index],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: AppDouble.double20,
                          ),
                          itemCount: productDetailsCtrl.imageList.length,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppDouble.double10.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDouble.double13).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Brand Name
                      Text(
                        'Brand name',
                        style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                          color: MyColors.greyColor,
                          fontSize: AppDouble.double14.sp,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Brand Product Name
                      Text(
                        'Products name',
                        style: MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                          fontSize: AppDouble.double16.sp,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Product Price
                      Row(
                        children: [
                          Text(
                            '\$334',
                            style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                .copyWith(
                              letterSpacing: 0,
                              fontSize: AppDouble.double20.sp,
                            ),
                          ),
                          SizedBox(width: AppDouble.double6.w),
                          Text(
                            '\$334',
                            style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                .copyWith(
                              letterSpacing: 0,
                              color: MyColors.greyColor,
                              decoration: TextDecoration.lineThrough,
                              fontSize: AppDouble.double15.sp,
                            ),
                          ),
                          SizedBox(width: AppDouble.double6.w),
                          Text(
                            '15% OFF',
                            style:
                                MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                              letterSpacing: 0,
                              color: MyColors.redColor,
                              fontSize: AppDouble.double13.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Delivery  Prices
                      false
                          ? Row(
                              children: [
                                const Icon(Iconsax.truck_fast),
                                SizedBox(width: AppDouble.double10),
                                Text(
                                  AppStrings.freeDelivery,
                                  style: MyTextStyle.poppinsRegularTextStyleF13
                                      .copyWith(
                                    color: MyColors.greenColor,
                                    fontSize: AppDouble.double14.sp,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                const Icon(Iconsax.truck_fast),
                                SizedBox(width: AppDouble.double10),
                                Text(
                                  '${AppStrings.deliveryFee} : ₹40',
                                  style: MyTextStyle.poppinsRegularTextStyleF13
                                      .copyWith(
                                    fontSize: AppDouble.double14.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Rating Section
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppDouble.double4,
                              vertical: AppDouble.double2,
                            ).r,
                            decoration: BoxDecoration(
                                color: MyColors.primaryColor.withOpacity(0.4),
                                borderRadius:
                                    BorderRadius.circular(AppDouble.double3).r),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.star5,
                                  size: AppDouble.double15.r,
                                  // color: MyColors.whiteColor,
                                ),
                                SizedBox(width: AppDouble.double4.w),
                                Text(
                                  '5.6',
                                  style: MyTextStyle.poppinsRegularTextStyleF13
                                      .copyWith(
                                    fontSize: AppDouble.double13.sp,
                                    letterSpacing: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: AppDouble.double8.w),
                          Text(
                            '56 ${AppStrings.reviews}',
                            style:
                                MyTextStyle.poppinsRegularTextStyleF13.copyWith(
                              fontSize: AppDouble.double13.sp,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Product Color & Color Image Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Colors: ',
                                textAlign: TextAlign.center,
                                style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                    .copyWith(
                                  fontSize: AppDouble.double16.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                'White',
                                textAlign: TextAlign.center,
                                style: MyTextStyle.poppinsRegularTextStyleF13
                                    .copyWith(
                                  fontSize: AppDouble.double14.sp,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Only 5 Left',
                            textAlign: TextAlign.center,
                            style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                .copyWith(
                              fontSize: AppDouble.double12.sp,
                              color: MyColors.greyColor,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      Row(
                        children: List.generate(
                          true
                              ? productDetailsCtrl.colorList.length
                              : productDetailsCtrl.imageList.length,
                          (index) => true
                              ? GestureDetector(
                                  onTap: () {
                                    productDetailsCtrl.selectColorIndex.value =
                                        index;
                                    productDetailsCtrl.update();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      height: AppDouble.double20.h,
                                      width: AppDouble.double20.h,
                                      decoration: BoxDecoration(
                                        color:
                                            productDetailsCtrl.colorList[index],
                                        border: Border.all(
                                          color: productDetailsCtrl
                                                      .selectColorIndex.value ==
                                                  index
                                              ? MyColors.primaryColor
                                              : MyColors.whiteColor,
                                          width: AppDouble.double2,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    productDetailsCtrl.selectImageIndex.value =
                                        index;
                                    productDetailsCtrl.update();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: productDetailsCtrl
                                                    .selectImageIndex.value ==
                                                index
                                            ? MyColors.primaryColor
                                            : MyColors.whiteColor,
                                        width: AppDouble.double2,
                                      ),
                                    ),
                                    child: MyImage(
                                      imageUrl:
                                          productDetailsCtrl.imageList[index],
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Product Size
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Size',
                            textAlign: TextAlign.center,
                            style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                .copyWith(
                              fontSize: AppDouble.double16.sp,
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            'Size Card',
                            textAlign: TextAlign.center,
                            style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                .copyWith(
                              fontSize: AppDouble.double12.sp,
                              color: MyColors.greyColor,
                              decoration: TextDecoration.underline,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppDouble.double6.h),
                      Row(
                        children: List.generate(
                          productDetailsCtrl.sizeList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              productDetailsCtrl.selectSizeIndex.value = index;
                              productDetailsCtrl.update();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                height: AppDouble.double40,
                                width: AppDouble.double40,
                                // padding: EdgeInsets.all(AppDouble.double8).r,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppDouble.double4),
                                  border: Border.all(
                                    color: productDetailsCtrl
                                                .selectSizeIndex.value ==
                                            index
                                        ? MyColors.primaryColor
                                        : MyColors.greyColor,
                                  ),
                                ),
                                child: Text(productDetailsCtrl.sizeList[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: AppDouble.double6.h),

                      /// Products
                      const SeeMoreTile(
                        title: 'Offer Products',
                        padding: EdgeInsets.zero,
                        icon: SizedBox(),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Skeletonizer(
                          enabled: false,
                          ignoreContainers: true,
                          ignorePointers: true,
                          enableSwitchAnimation: true,
                          child: Row(children: [
                            ...List.generate(
                              8,
                              (index) => GestureDetector(
                                // onTap: () => Get.toNamed(Routes.paymentScreen),
                                onTap: () =>
                                    Get.toNamed(Routes.productDetailsScreen),
                                child: const CartDesignWidgetSmall(
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
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageTopMenu() {
    return Padding(
      padding: EdgeInsets.only(top: AppDouble.double10).r,
      child: Row(
        children: [
          SizedBox(width: AppDouble.double10.w),
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Iconsax.arrow_left)),
          ),
          const Spacer(),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Iconsax.heart)),
          ),
          SizedBox(width: AppDouble.double10.w),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Iconsax.share)),
          ),
          SizedBox(width: AppDouble.double10.w),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(AppDouble.double6).r,
              decoration: BoxDecoration(
                color: MyColors.whiteColor.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: const Icon(Iconsax.shopping_bag),
            ),
          ),
          SizedBox(width: AppDouble.double10.w),
        ],
      ),
    );
  }
}
