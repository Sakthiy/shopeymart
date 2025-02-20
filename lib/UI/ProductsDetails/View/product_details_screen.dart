import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/banner_images.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/cart_design_widget_small.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/my_image.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/see_more_tile.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/Favorite/Ctrl/favorite_ctrl.dart';
import 'package:shopeymart/UI/ProductsDetails/Ctrl/product_details_ctrl.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final productDetailsCtrl = Get.put(ProductDetailsCtrl());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: true);
        return true;
      },
      child: Scaffold(
        body: SafeArea(
            child: Obx(
          () => productDetailsCtrl.productModel.value == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          BannerImages(
                            height: Get.size.height / 2,
                            viewportFraction: 1,
                            bannerImageList: productDetailsCtrl.productModel
                                .value!.data.first.variants.first.images
                                .map(
                                  (e) => e,
                                )
                                .toList(),
                          ),
                          // MyImage(
                          //   fit: BoxFit.cover,
                          //   height: AppDouble.double270.h,
                          //   imageUrl: productDetailsCtrl.productModel.value!
                          //           .data.first.variants.first.images[
                          //       productDetailsCtrl.selectImageIndex.value],
                          // ),
                          imageTopMenu(productDetailsCtrl),
                        ],
                      ),
                      SizedBox(height: AppDouble.double10.h),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: AppDouble.double13)
                                .w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /// Variant  Images
                            productDetailsCtrl.productModel.value!.data.first
                                        .variants.length ==
                                    1
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: Get.size.width / 3,
                                      child: ListView.separated(
                                        itemCount: productDetailsCtrl
                                            .productModel
                                            .value!
                                            .data
                                            .first
                                            .variants
                                            .length,
                                        // padding:
                                        //     EdgeInsets.only(left: AppDouble.double20),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            GestureDetector(
                                          onTap: () {
                                            productDetailsCtrl
                                                .selectImageIndex.value = index;
                                            productDetailsCtrl.update();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: productDetailsCtrl
                                                          .selectImageIndex
                                                          .value ==
                                                      index
                                                  ? Border.all(
                                                      color:
                                                          MyColors.primaryColor,
                                                      width: AppDouble.double2,
                                                    )
                                                  : const Border(),
                                            ),
                                            child: MyImage(
                                              errorImageWidth:
                                                  Get.size.width / 4,
                                              // errorImageHeight: Get.size.height / 4,
                                              imageUrl: productDetailsCtrl
                                                  .productModel
                                                  .value!
                                                  .data
                                                  .first
                                                  .variants[index]
                                                  .images
                                                  .first,
                                            ),
                                          ),
                                        ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: AppDouble.double20,
                                        ),
                                      ),
                                    ),
                                  ),

                            /// Brand Name
                            productDetailsCtrl.productModel.value!.data.first
                                        .fkBrand ==
                                    null
                                ? const SizedBox()
                                : Text(
                                    productDetailsCtrl.productModel.value!.data
                                        .first.fkBrand!.brandName,
                                    style: MyTextStyle
                                        .poppinsRegularTextStyleF13
                                        .copyWith(
                                      color: MyColors.greyColor,
                                      fontSize: AppDouble.double14.sp,
                                      letterSpacing: 0,
                                    ),
                                  ),
                            SizedBox(height: AppDouble.double6.h),

                            /// Brand Product Name
                            Text(
                              productDetailsCtrl
                                  .productModel.value!.data.first.productName,
                              style: MyTextStyle.poppinsRegularTextStyleF13
                                  .copyWith(
                                fontSize: AppDouble.double16.sp,
                                letterSpacing: 0,
                              ),
                            ),
                            SizedBox(height: AppDouble.double6.h),

                            /// Limited time offer
                            productDetailsCtrl.minutes.value == 0
                                ? const SizedBox()
                                : Row(
                                    spacing: Get.size.width / 2.5,
                                    children: [
                                      Text(
                                        AppStrings.limitedTimeOffer,
                                        style: MyTextStyle
                                            .poppinsRegularTextStyleF13
                                            .copyWith(
                                          letterSpacing: 0,
                                          color: MyColors.redColor,
                                          fontSize: AppDouble.double13.sp,
                                        ),
                                      ),
                                      Text(
                                        '${productDetailsCtrl.days.toString().padLeft(2, '0')}d:${productDetailsCtrl.hours.toString().padLeft(2, '0')}h:${productDetailsCtrl.minutes.toString().padLeft(2, '0')}m:${productDetailsCtrl.seconds.toString().padLeft(2, '0')}s',
                                        style: MyTextStyle
                                            .poppinsRegularTextStyleF13
                                            .copyWith(
                                          letterSpacing: 0,
                                          color: MyColors.redColor,
                                          fontSize: AppDouble.double13.sp,
                                        ),
                                      ),
                                    ],
                                  ),

                            /// Product Price
                            Row(
                              children: [
                                Text(
                                  '₹ ${productDetailsCtrl.productModel.value!.data.first.variants.first.sellingPrice}',
                                  style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                      .copyWith(
                                    letterSpacing: 0,
                                    fontSize: AppDouble.double20.sp,
                                  ),
                                ),
                                SizedBox(width: AppDouble.double6.w),
                                Text(
                                  '₹ ${productDetailsCtrl.productModel.value!.data.first.variants.first.price}',
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
                                  productDetailsCtrl.productModel.value!.data
                                              .first.offerDiscountType ==
                                          'Percentage'
                                      ? '${productDetailsCtrl.productModel.value!.data.first.offerDiscount}% Off'
                                      : '-${productDetailsCtrl.productModel.value!.data.first.offerDiscount} Flat',
                                  style: MyTextStyle.poppinsRegularTextStyleF13
                                      .copyWith(
                                    letterSpacing: 0,
                                    color: MyColors.redColor,
                                    fontSize: AppDouble.double13.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppDouble.double6.h),

                            /// Delivery  Prices
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Iconsax.truck_fast),
                                      SizedBox(width: AppDouble.double10),
                                      productDetailsCtrl.productModel.value!
                                                  .data.first.shippingFeeType !=
                                              'Free Shipping'
                                          ? Text(
                                              "Shipping Free ₹ ${productDetailsCtrl.productModel.value!.data.first.shippingFee}",
                                              style: MyTextStyle
                                                  .poppinsRegularTextStyleF13
                                                  .copyWith(
                                                fontSize: AppDouble.double14.sp,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 0,
                                              ),
                                            )
                                          : Text(
                                              AppStrings.freeDelivery,
                                              style: MyTextStyle
                                                  .poppinsRegularTextStyleF13
                                                  .copyWith(
                                                color: MyColors.greenColor,
                                                fontSize: AppDouble.double14.sp,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                      productDetailsCtrl
                                                  .productModel
                                                  .value!
                                                  .data
                                                  .first
                                                  .variants
                                                  .first
                                                  .stock >
                                              productDetailsCtrl
                                                  .productModel
                                                  .value!
                                                  .data
                                                  .first
                                                  .minStockWarning
                                          ? const SizedBox()
                                          : VerticalDivider(
                                              color: MyColors.blackColor),

                                      /// Limited Stock
                                      productDetailsCtrl
                                                  .productModel
                                                  .value!
                                                  .data
                                                  .first
                                                  .variants
                                                  .first
                                                  .stock >
                                              productDetailsCtrl
                                                  .productModel
                                                  .value!
                                                  .data
                                                  .first
                                                  .minStockWarning
                                          ? const SizedBox()
                                          : Text(
                                              "${productDetailsCtrl.productModel.value!.data.first.variants.first.stock} ${AppStrings.onlyLeft}",
                                              style: MyTextStyle
                                                  .poppinsRegularTextStyleF13
                                                  .copyWith(
                                                letterSpacing: 0,
                                                color: MyColors.redColor,
                                                fontSize: AppDouble.double10.sp,
                                              ),
                                            ),
                                    ],
                                  ),

                                  /// Quantity Section

                                  Container(
                                    height: Get.size.width / AppDouble.double16,
                                    padding: EdgeInsets.only(
                                        left: AppDouble.double6),
                                    decoration: BoxDecoration(
                                      // color: MyColors.greyColor,

                                      borderRadius: BorderRadius.circular(
                                              AppDouble.double4)
                                          .r,
                                      border:
                                          Border.all(color: MyColors.greyColor),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(AppStrings.qty),
                                        // SizedBox(width: AppDouble.double8.w),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton<int>(
                                            padding: EdgeInsets.only(
                                                left: AppDouble.double12.w),
                                            borderRadius: BorderRadius.circular(
                                              AppDouble.double6,
                                            ).r,
                                            value: productDetailsCtrl
                                                .selectedQuantity
                                                .value, // The currently selected value
                                            onChanged: (int? newValue) {
                                              productDetailsCtrl
                                                  .selectedQuantity
                                                  .value = newValue!;
                                            },
                                            items: productDetailsCtrl
                                                .quantityList
                                                .map<DropdownMenuItem<int>>(
                                                    (int value) {
                                              return DropdownMenuItem<int>(
                                                value: value,
                                                child: Text("$value"),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                                      color: MyColors.primaryColor
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(
                                              AppDouble.double3)
                                          .r),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        style: MyTextStyle
                                            .poppinsRegularTextStyleF13
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
                                  style: MyTextStyle.poppinsRegularTextStyleF13
                                      .copyWith(
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
                                      style: MyTextStyle
                                          .poppinsSemiBoldTextStyleF15
                                          .copyWith(
                                        fontSize: AppDouble.double16.sp,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    Text(
                                      'White',
                                      textAlign: TextAlign.center,
                                      style: MyTextStyle
                                          .poppinsRegularTextStyleF13
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
                                          productDetailsCtrl
                                              .selectColorIndex.value = index;
                                          productDetailsCtrl.update();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Container(
                                            height: AppDouble.double20.h,
                                            width: AppDouble.double20.h,
                                            decoration: BoxDecoration(
                                              color: productDetailsCtrl
                                                  .colorList[index],
                                              border: Border.all(
                                                color: productDetailsCtrl
                                                            .selectColorIndex
                                                            .value ==
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
                                          productDetailsCtrl
                                              .selectImageIndex.value = index;
                                          productDetailsCtrl.update();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: productDetailsCtrl
                                                          .selectImageIndex
                                                          .value ==
                                                      index
                                                  ? MyColors.primaryColor
                                                  : MyColors.whiteColor,
                                              width: AppDouble.double2,
                                            ),
                                          ),
                                          child: MyImage(
                                            imageUrl: productDetailsCtrl
                                                .imageList[index],
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
                                    productDetailsCtrl.selectSizeIndex.value =
                                        index;
                                    productDetailsCtrl.update();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      height: AppDouble.double40,
                                      width: AppDouble.double40,
                                      // padding: EdgeInsets.all(AppDouble.double8).r,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppDouble.double4),
                                        border: Border.all(
                                          color: productDetailsCtrl
                                                      .selectSizeIndex.value ==
                                                  index
                                              ? MyColors.primaryColor
                                              : MyColors.greyColor,
                                        ),
                                      ),
                                      child: Text(
                                          productDetailsCtrl.sizeList[index]),
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
                                      onTap: () => Get.toNamed(
                                          Routes.productDetailsScreen),
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
        )),
        bottomSheet: Obx(
          () => productDetailsCtrl.apiController.isLoading.value ||
                  productDetailsCtrl.productModel.value == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: AppDouble.double10.w,
                    children: [
                      Expanded(
                          child: MyButton(
                        title: AppStrings.buyNow,
                        textColor: MyColors.whiteColor,
                      )),
                      Expanded(
                        child: MyButton(
                          onTap: productDetailsCtrl.isStockAvailable.value
                              ? null
                              : () async {
                                  await productDetailsCtrl.addToCartFun(
                                    productId: productDetailsCtrl
                                        .productModel.value!.data.first.id,
                                    variantId: productDetailsCtrl.productModel
                                        .value!.data.first.variants.first.id,
                                    quantity: productDetailsCtrl
                                        .selectedQuantity.value,
                                  );
                                  productDetailsCtrl.getCartData();
                                },
                          title: productDetailsCtrl.isStockAvailable.value
                              ? AppStrings.outOfStock
                              : AppStrings.addToCart,
                          containerColor: MyColors.transparent,
                          borderColor: MyColors.greyColor,
                          // textColor: MyColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget imageTopMenu(ProductDetailsCtrl productDetailsCtrl) {
    return Padding(
      padding: EdgeInsets.only(top: AppDouble.double10).r,
      child: Row(
        children: [
          SizedBox(width: AppDouble.double10.w),
          GestureDetector(
            onTap: () => Get.back(result: true),
            child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.arrow_left,
                  color: MyColors.blackColor,
                )),
          ),
          const Spacer(),
          GestureDetector(
            onTap:
                productDetailsCtrl.productModel.value!.data.first.isInWishlist
                    ? () async {
                        productDetailsCtrl.isFavouriteLoad.value = true;
                        productDetailsCtrl.productModel.value!.data.first
                            .isInWishlist = false;
                        Get.put(FavoriteCtrl()).favoriteDelete(
                            productId: productDetailsCtrl
                                .productModel.value!.data.first.id);
                        setState(() {});
                        await Future.delayed(const Duration(seconds: 2));
                        productDetailsCtrl.isFavouriteLoad.value = false;
                      }
                    : () async {
                        productDetailsCtrl.isFavouriteLoad.value = true;
                        productDetailsCtrl
                            .productModel.value!.data.first.isInWishlist = true;
                        Get.put(FavoriteCtrl()).favoritePost(
                            productId: productDetailsCtrl
                                .productModel.value!.data.first.id);
                        setState(() {});
                        await Future.delayed(const Duration(seconds: 2));
                        productDetailsCtrl.isFavouriteLoad.value = false;
                      },
            child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: productDetailsCtrl.isFavouriteLoad.value
                    ? SizedBox(
                        width: AppDouble.double20.w,
                        height: AppDouble.double20.w,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: AppDouble.double3,
                          ),
                        ),
                      )
                    : Icon(
                        productDetailsCtrl
                                .productModel.value!.data.first.isInWishlist
                            ? Iconsax.heart5
                            : Iconsax.heart,
                        color: productDetailsCtrl
                                .productModel.value!.data.first.isInWishlist
                            ? MyColors.redColor
                            : MyColors.blackColor,
                      )),
          ),
          SizedBox(width: AppDouble.double10.w),
          GestureDetector(
            child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.send_2, color: MyColors.blackColor)),
          ),
          SizedBox(width: AppDouble.double10.w),
          Obx(
            () => GestureDetector(
              onTap: () async {
                // productDetailsCtrl.getCartData();
                // bool result =
                await Get.toNamed(Routes.cartScreen);
                // if (result){
                //   productDetailsCtrl.getCartData();
                // }
              },
              child: Container(
                padding: EdgeInsets.all(AppDouble.double6).r,
                decoration: BoxDecoration(
                  color: MyColors.whiteColor.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Badge(
                  isLabelVisible: productDetailsCtrl.cartCtrl.cartModel.value ==
                              null ||
                          productDetailsCtrl.cartCtrl.cartModel.value!.count ==
                              null
                      ? false
                      : true,
                  label: productDetailsCtrl.cartCtrl.cartModel.value == null
                      ? const SizedBox()
                      : Text('${productDetailsCtrl.cartCount.value}',
                          style: TextStyle(
                            color: MyColors.whiteColor,
                          )),
                  child: Icon(
                    Iconsax.shopping_bag,
                    color: MyColors.blackColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: AppDouble.double10.w),
        ],
      ),
    );
  }
}
