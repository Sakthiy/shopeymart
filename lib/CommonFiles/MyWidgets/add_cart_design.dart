import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/my_image.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/UI/CartScreen/Ctrl/cart_ctrl.dart';

class AddCartDesign extends StatelessWidget {
  const AddCartDesign({
    super.key,
    required this.cartCtrl,
    required this.imageUrl,
    required this.productName,
    required this.productVariantName,
    required this.initialRating,
    required this.minRating,
    this.onRatingUpdate,
    required this.rating,
    required this.ratingMemberCount,
    required this.discountType,
    this.onPressedDelete,
    this.onPressedBuyNow,
    required this.index,
    this.imageTitleOnTap,
  });

  final CartCtrl cartCtrl;
  final String imageUrl;
  final String productName;
  final String productVariantName;
  final String discountType;
  final double initialRating;
  final double minRating;
  final double rating;
  final int index;
  final double ratingMemberCount;
  final ValueChanged<double>? onRatingUpdate;
  final VoidCallback? onPressedDelete;
  final VoidCallback? onPressedBuyNow;
  final GestureTapCallback? imageTitleOnTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: MyPadding.edgeInsets8.r,
        child: Column(
          children: [
            GestureDetector(
              onTap: imageTitleOnTap,
              child: Row(
                spacing: AppDouble.double14.w,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    spacing: AppDouble.double14.h,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppDouble.double4).r,
                            border: Border.all(color: MyColors.greyColor)),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppDouble.double5).r,
                          child: MyImage(
                            scale: AppDouble.double8,
                            fit: BoxFit.cover,
                            width: Get.size.width / 4.3,
                            height: Get.size.height / 9,
                            imageUrl: imageUrl,
                          ),
                        ),
                      ),
                      Container(
                        // height: Get.size.width / AppDouble.double16,
                        padding: EdgeInsets.only(left: AppDouble.double6),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppDouble.double4).r,
                          border: Border.all(color: MyColors.greyColor),
                        ),
                        child: Row(
                          children: [
                            Text(AppStrings.qty),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                padding:
                                    EdgeInsets.only(left: AppDouble.double12.w),
                                borderRadius: BorderRadius.circular(
                                  AppDouble.double6,
                                ).r,
                                value: cartCtrl.selectedQuantity
                                    .value, // The currently selected value
                                onChanged: (int? newValue) {
                                  cartCtrl.selectedQuantity.value = newValue!;
                                },
                                items: cartCtrl.quantityList
                                    .map<DropdownMenuItem<int>>((int value) {
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
                  Flexible(
                    child: Column(
                      spacing: AppDouble.double4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyle.poppinsMediumTextStyle
                              .copyWith(fontSize: 16.sp),
                        ),
                        Text(
                          productVariantName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: MyColors.greyColor,
                          ),
                        ),
                        Row(
                          spacing: AppDouble.double4.w,
                          children: [
                            RatingBar.builder(
                              initialRating: initialRating,
                              minRating: minRating,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              glow: false,
                              itemSize: AppDouble.double18.r,
                              itemCount: 5,
                              // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star_rounded,
                                color: MyColors.greenColor,
                              ),
                              onRatingUpdate: (v) {},
                            ),
                            Text(
                              rating.toString(),
                              style:
                                  MyTextStyle.poppinsMediumTextStyle.copyWith(
                                color: MyColors.greenColor,
                              ),
                            ),
                            Text(
                              '($ratingMemberCount)',
                              style: TextStyle(
                                color: MyColors.greyColor,
                              ),
                            ),
                          ],
                        ),
                        Wrap(
                          spacing: AppDouble.double4.w,
                          children: [
                            discountType == 'Percentage'
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_downward_sharp,
                                        color: MyColors.greenColor,
                                      ),
                                      Text(
                                        '67% Off',
                                        style: MyTextStyle
                                            .poppinsMediumTextStyle
                                            .copyWith(
                                          color: MyColors.greenColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    '-200 Flat',
                                    style: MyTextStyle.poppinsMediumTextStyle
                                        .copyWith(
                                      color: MyColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            cartCtrl.cartModel.value!.cart.items[index].price ==
                                    null
                                ? const SizedBox()
                                : cartCtrl.cartModel.value!.cart.items[index]
                                            .price ==
                                        0
                                    ? const SizedBox()
                                    : Text(
                                        '₹${cartCtrl.cartModel.value!.cart.items[index].price}',
                                        style: MyTextStyle
                                            .poppinsSemiBoldTextStyleF15
                                            .copyWith(
                                          letterSpacing: 0,
                                          color: MyColors.greyColor,
                                          // fontSize: AppDouble.double15.sp,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                            Text(
                              '₹${cartCtrl.cartModel.value!.cart.items[index].sellingPrice}',
                              style: MyTextStyle.poppinsSemiBoldTextStyleF15
                                  .copyWith(
                                letterSpacing: 0,
                                // fontSize: AppDouble.double13.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cartCtrl.isCarDeleteModel.value
                      ? const CircularProgressIndicator()
                      : TextButton.icon(
                          style: ButtonStyle(
                            iconColor:
                                WidgetStatePropertyAll(MyColors.greyColor),
                          ),
                          onPressed: onPressedDelete,
                          icon: const Icon(Iconsax.trash),
                          label: Text(
                            AppStrings.remove,
                            style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
                              color: MyColors.greyColor,
                            ),
                          ),
                        ),
                  const VerticalDivider(),
                  TextButton.icon(
                    style: ButtonStyle(
                      iconColor: WidgetStatePropertyAll(MyColors.greyColor),
                    ),
                    onPressed: onPressedBuyNow,
                    icon: const Icon(Iconsax.flash),
                    label: Text(
                      AppStrings.buyThisNow,
                      style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
                        color: MyColors.greyColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
