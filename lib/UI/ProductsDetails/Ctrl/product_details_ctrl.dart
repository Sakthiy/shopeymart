import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/my_bottom_sheet.dart';
import 'package:shopeymart/Core/api/api_ctrl.dart';
import 'package:shopeymart/Core/api/api_dio_service.dart';
import 'package:shopeymart/Core/api/api_string.dart';
import 'package:shopeymart/PageRoutes/routes_manager.dart';
import 'package:shopeymart/UI/CartScreen/Ctrl/cart_ctrl.dart';
import 'package:shopeymart/UI/CartScreen/Model/add_to_cart_post_model.dart';
import 'package:shopeymart/UI/ProductsDetails/Model/product_model.dart';

class ProductDetailsCtrl extends GetxController {
  final apiController = ApiController();
  final cartCtrl = Get.put(CartCtrl());
  final productModel = Rxn<ProductModel>();
  final addToCartPostModel = Rxn<AddToCartPostModel>();
  var isFavouriteLoad = false.obs;
  var isStockAvailable = false.obs;
  RxInt selectedQuantity = 0.obs;
  RxList<int> quantityList = <int>[].obs;
  var cartCount = 0.obs;

  RxInt selectImageIndex = 0.obs;
  RxInt selectColorIndex = 0.obs;
  RxInt selectSizeIndex = 0.obs;

  List<String> imageList = [
    'https://cdn.pixabay.com/photo/2024/05/26/10/15/bird-8788491_1280.jpg',
    'https://cdn.pixabay.com/photo/2023/05/23/15/13/new-8012937_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/05/06/14/00/water-3378639_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/05/05/02/40/jetty-1373173_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/03/09/18/34/beach-666122_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/09/12/15/21/resort-4471852_1280.jpg',
  ];

  List<Color> colorList = [
    const Color(0xFF40E0D0),
    const Color(0xFF800000),
    const Color(0xFFDE3163),
    const Color(0xFF808000),
  ];

  List<String> sizeList = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
  ];

  ///Product
  getProductDetails({required String productId}) async {
    await apiController.fetchData(
        url: '${ApiString.productsUrl}$productId', method: HttpMethod.get);
    productModel.value = productModelFromJson(apiController.data.value!);

    /// Product Quantity Cal
    selectedQuantity.value = productModel.value!.data.first.minOrderQty;
    isStockAvailable.value =
        productModel.value!.data.first.variants.first.stock == 0;
    for (int i = productModel.value!.data.first.minOrderQty;
        i <= productModel.value!.data.first.variants.first.stock;
        i++) {
      quantityList.add(i);
    }

    startCountdown(
      startTimer: productModel.value!.data.first.offerStartDate,
      endTimer: productModel.value!.data.first.offerEndDate,
    );
  }

  addToCartFun({
    required String productId,
    required String variantId,
    required int quantity,
  }) async {
    await apiController
        .fetchData(url: ApiString.addToCart, method: HttpMethod.post, data: {
      "productId": productId,
      "variantId": variantId,
      "quantity": quantity,
    });

    addToCartPostModel.value =
        addToCartPostModelFromJson(apiController.data.value!);
    if (addToCartPostModel.value!.success == true) {
      MyBottomSheet.showToastMassage(msg: addToCartPostModel.value!.message);
    }
  }

  RxString productTimer = ''.obs;

  /// ================================================================
  RxInt days = 0.obs;
  RxInt hours = 0.obs;
  RxInt minutes = 0.obs;
  RxInt seconds = 0.obs;

  late Timer _timer;

  // Define the offer start date and offer end date
  // final DateTime offerStartDate = DateTime.parse("2025-02-02T12:59:11.582Z");
  // final DateTime offerEndDate = DateTime.parse("2025-02-28T12:59:11.582Z");

  // Function to start the countdown timer
  void startCountdown(
      {required DateTime startTimer, required DateTime endTimer}) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final DateTime offerStartDate = startTimer;
      final DateTime offerEndDate = endTimer;

      DateTime now = DateTime.now();

      // Calculate the remaining time until the offer starts or ends
      Duration remainingTime;

      if (now.isBefore(offerStartDate)) {
        // Calculate time remaining until the offer starts
        remainingTime = offerStartDate.difference(now);
      } else if (now.isBefore(offerEndDate)) {
        // Calculate time remaining until the offer ends
        remainingTime = offerEndDate.difference(now);
      } else {
        // If the offer has ended
        _timer.cancel();
        days.value = 0;
        hours.value = 0;
        minutes.value = 0;
        seconds.value = 0;
        return;
      }

      // Apply a 12-hour offset to the remaining time
      remainingTime = remainingTime - const Duration(hours: 12);

      // Calculate days, hours, minutes, and seconds
      days.value = remainingTime.inDays;
      hours.value = (remainingTime.inHours % 24);
      minutes.value = (remainingTime.inMinutes % 60);
      seconds.value = (remainingTime.inSeconds % 60);
    });
  }

  // Stop the countdown
  void stopCountdown() {
    _timer.cancel();
  }

  // Reset the countdown
  void resetCountdown() {
    _timer.cancel();
    days.value = 0;
    hours.value = 0;
    minutes.value = 0;
    seconds.value = 0;
  }

  getCartData() async {
    await cartCtrl.getCartData();
    cartCount.value = cartCtrl.cartCount.value;
  }

  @override
  void onInit() {
    getProductDetails(productId: Get.parameters['productId']!);
    getCartData();
    super.onInit();
  }

  @override
  void dispose() {
    resetCountdown();
    super.dispose();
  }

  @override
  void onClose() {
    resetCountdown();
    super.onClose();
  }
}
