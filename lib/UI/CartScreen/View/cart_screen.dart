import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shopeymart/CommonFiles/MyWidgets/add_cart_design.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/app_strings.dart';
import 'package:shopeymart/CommonFiles/common_function.dart';
import 'package:shopeymart/CommonFiles/image_strings.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/CommonFiles/my_button.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:shopeymart/CommonFiles/my_padding.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/CartScreen/Ctrl/cart_ctrl.dart';
import 'package:shopeymart/UI/Dashboard/Ctrl/dash_board_ctrl.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartCtrl = Get.put(CartCtrl());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.addToCart),
      ),
      body: Obx(
        () => cartCtrl.cartModel.value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : cartCtrl.cartModel.value!.cart.items.isEmpty
                ? buildEmpty()
                : bodyContent(),
      ),
    );
  }

  Widget buildEmpty() {
    return Center(
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Lottie.asset(
            ImageStrings.cartEmpty,
            height: AppDouble.double230.h,
          ),
          Text(
            AppStrings.cartEmptyMessage,
            style: MyTextStyle.poppinsMediumTextStyle.copyWith(
              letterSpacing: 0,
            ),
          ),
          Text(
            AppStrings.addSomeProductsMessage,
            style: MyTextStyle.poppinsBoldTextStyleF13,
          ),
          SizedBox(
            width: Get.size.width / 1.4,
            child: MyButton(
              onTap: () {
                Get.back();
                Get.put(DashBoardCtrl()).bottomCurrentIndex.value = 0;
              },
              textColor: MyColors.whiteColor,
              title: AppStrings.getStarted,
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyContent() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              /// Deliver Address
              deliverAddressWidget(),
              const Divider(),

              /// Cart UI
              ListView.separated(
                shrinkWrap: true,
                itemCount: cartCtrl.cartModel.value!.cart.items.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppDouble.double10.h),
                itemBuilder: (context, index) => AddCartDesign(
                  imageTitleOnTap: () async {
                    bool result = await Get.toNamed(
                      Routes.productDetailsScreen,
                      parameters: {
                        "productId": cartCtrl.cartModel.value!.cart.items[index]
                            .product.productId
                      },
                    );
                    if (result) cartCtrl.getCartData();
                  },
                  onPressedDelete: () => cartCtrl.deleteCartData(
                    productId: cartCtrl
                        .cartModel.value!.cart.items[index].product.productId,
                    variantId: cartCtrl
                        .cartModel.value!.cart.items[index].variant.variantId,
                  ),
                  index: index,
                  discountType: 'Percentage',
                  rating: 3.4,
                  ratingMemberCount: 3444,
                  cartCtrl: cartCtrl,
                  imageUrl:
                      'https://rukminim2.flixcart.com/image/832/832/xif0q/smartwatch/s/i/u/-original-imah76jt64ffmwg4.jpeg?q=70&crop=false',
                  productName: cartCtrl
                      .cartModel.value!.cart.items[index].product.productName,
                  productVariantName: cartCtrl
                      .cartModel.value!.cart.items[index].product.productName,
                  initialRating: 3,
                  minRating: 1,
                ),
              ),

              SizedBox(height: AppDouble.double10.h),
              priceDetailsWidget(),
              SizedBox(height: AppDouble.double10.h),
              VisibilityDetector(
                key: UniqueKey(),
                onVisibilityChanged: (info) {
                  var visiblePercentage = info.visibleFraction * 100;

                  if (visiblePercentage == 0.0) {
                    cartCtrl.isPlaceOrderWidget.value = true;
                  } else {
                    cartCtrl.isPlaceOrderWidget.value = false;
                  }
                },
                child: placeOrderWidget(),
              ),
              SizedBox(height: AppDouble.double10.h),
            ],
          ),
        ),
        Visibility(
          visible: cartCtrl.isPlaceOrderWidget.value,
          child: Container(
            height: Get.size.height / 16,
            alignment: Alignment.bottomCenter,
            child: placeOrderWidget(),
          ),
        ),
      ],
    );
  }

  Widget deliverAddressWidget() {
    return ListTile(
      title: Row(
        spacing: AppDouble.double14.w,
        children: [
          Row(
            children: [
              Text(
                "${AppStrings.deliverTo}: ",
                style: const TextStyle(),
              ),
              const Text(
                "Sakthivel P, 636803",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDouble.double4.w,
                  vertical: AppDouble.double2.h),
              decoration: BoxDecoration(
                color: MyColors.lightBlueBGColor,
                borderRadius: BorderRadius.circular(AppDouble.double4).r,
              ),
              child: Text(
                AppStrings.home.toUpperCase(),
                style: TextStyle(
                  color: MyColors.greyColor,
                  fontSize: AppDouble.double11.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
      subtitle: Text(
        "Adhyaman kottai,Dharmapuri",
        style: TextStyle(
          color: MyColors.greyColor,
        ),
      ),
      trailing: FittedBox(
        child: MyButton(
          borderRadius: 4,
          textPadding: EdgeInsets.symmetric(
              vertical: AppDouble.double6.h, horizontal: AppDouble.double16.w),
          borderColor: MyColors.greyColor,
          title: AppStrings.change,
          fontSize: AppDouble.double10.sp,
          fontWeight: FontWeight.bold,
          containerColor: MyColors.transparent,
          textColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget priceDetailsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppDouble.double6.h,
      children: [
        Padding(
          padding: MyPadding.horizontalEdgeInsets10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppDouble.double6.h,
            children: [
              Text(
                AppStrings.priceDetails,
                style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
                  fontSize: AppDouble.double16.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.price} (${cartCtrl.cartModel.value!.cart.items.length}${AppStrings.items})',
                    style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                      letterSpacing: 0,
                      fontSize: AppDouble.double14.sp,
                    ),
                  ),
                  Text(
                    '₹${CommonFunction.formatPrice(price: double.parse(cartCtrl.cartModel.value!.cart.totalAmount.toString()))}',
                    textAlign: TextAlign.end,
                    style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                      letterSpacing: 0,
                      fontSize: AppDouble.double14.sp,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.delivery,
                    style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                      letterSpacing: 0,
                      fontSize: AppDouble.double14.sp,
                    ),
                  ),
                  Text(
                    '-₹',
                    textAlign: TextAlign.end,
                    style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                      letterSpacing: 0,
                      color: MyColors.greenColor,
                      fontSize: AppDouble.double14.sp,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.deliveryCharges,
                    style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                      letterSpacing: 0,
                      fontSize: AppDouble.double14.sp,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '₹780',
                        textAlign: TextAlign.end,
                        style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                          letterSpacing: 0,
                          color: MyColors.greyColor,
                          // color: MyColors.greenColor,
                          fontSize: AppDouble.double14.sp,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: AppDouble.double6.sp),
                      Text(
                        AppStrings.fREEDelivery,
                        textAlign: TextAlign.end,
                        style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                          letterSpacing: 0,
                          color: MyColors.greenColor,
                          fontSize: AppDouble.double14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        DottedLine(dashColor: MyColors.greyColor),
        Padding(
          padding: MyPadding.horizontalEdgeInsets10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalAmount,
                style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
                  fontSize: AppDouble.double16.sp,
                ),
              ),
              Text(
                '₹${CommonFunction.formatPrice(price: double.parse(cartCtrl.cartModel.value!.cart.totalAmount.toString()))}',
                style: MyTextStyle.poppinsBoldTextStyleF13.copyWith(
                  fontSize: AppDouble.double16.sp,
                ),
              ),
            ],
          ),
        ),
        Divider(color: MyColors.greyColor),
        Padding(
          padding: MyPadding.horizontalEdgeInsets10,
          child: Text(
            '${AppStrings.youWillSave} ₹ 400 ${AppStrings.onThisOrder}',
            textAlign: TextAlign.end,
            style: MyTextStyle.poppinsMediumTextStyle.copyWith(
              letterSpacing: 0,
              color: MyColors.greenColor,
              fontWeight: FontWeight.bold,
              fontSize: AppDouble.double12.sp,
            ),
          ),
        ),
        Divider(color: MyColors.greyColor),
      ],
    );
  }

  Widget placeOrderWidget() {
    return Card(
      child: Padding(
        padding: MyPadding.horizontalEdgeInsets30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₹${CommonFunction.formatPrice(price: double.parse(cartCtrl.cartModel.value!.cart.totalAmount.toString()))}',
                  style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: MyColors.greyColor,
                    fontSize: AppDouble.double12.sp,
                    letterSpacing: 0,
                  ),
                ),
                Row(
                  spacing: AppDouble.double6.w,
                  children: [
                    Text(
                      '₹${CommonFunction.formatPrice(price: double.parse(cartCtrl.cartModel.value!.cart.totalAmount.toString()))}',
                      style: MyTextStyle.poppinsMediumTextStyle.copyWith(
                        fontSize: AppDouble.double20.sp,
                        letterSpacing: 0,
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      size: AppDouble.double14.r,
                      color: MyColors.greyColor,
                    ),
                  ],
                ),
              ],
            ),
            MyButton(
              title: AppStrings.placeOrder,
              textColor: MyColors.whiteColor,
              borderRadius: AppDouble.double6,
              textPadding: EdgeInsets.symmetric(
                  horizontal: AppDouble.double16.w,
                  vertical: AppDouble.double8.h),
              fontSize: 14.sp,
              textLetterSpacing: 0,
            )
          ],
        ),
      ),
    );
  }
}
