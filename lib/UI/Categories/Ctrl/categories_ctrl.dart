import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shopeymart/UI/Categories/Model/categories_model.dart';

class CategoriesCtrl extends GetxController {
  final categoriesResp = Rxn<CategoriesModel>();
  ScrollController scrollCategoriesCtrl = ScrollController();
  ScrollController scrollSubCategoriesCtrl = ScrollController();
  RxInt categoriesCurrentIndex = 0.obs;
  RxInt subCategoriesCurrentIndex = 0.obs;
  RxBool isSubCategoriesSelected = false.obs;
  RxString takingCategoriesAllItemsAppBarTitle = ''.obs;
  Map<String, dynamic> categories = {
    "categories": [
      {
        "id": 1,
        "name": "Electronics",
        "imageUrl": "https://picsum.photos/200/300?random=1",
        "subCategories": [
          {
            "id": 101,
            "name": "Mobile Phones",
            "imageUrl": "https://picsum.photos/200/300?random=101"
          },
          {
            "id": 102,
            "name": "Laptops",
            "imageUrl": "https://picsum.photos/200/300?random=102"
          },
          {
            "id": 103,
            "name": "Cameras",
            "imageUrl": "https://picsum.photos/200/300?random=103"
          },
          {
            "id": 104,
            "name": "Headphones",
            "imageUrl": "https://picsum.photos/200/300?random=104"
          },
          {
            "id": 105,
            "name": "Smart Watches",
            "imageUrl": "https://picsum.photos/200/300?random=105"
          }
        ]
      },
      {
        "id": 2,
        "name": "Fashion",
        "imageUrl": "https://picsum.photos/200/300?random=2",
        "subCategories": [
          {
            "id": 201,
            "name": "Men's Clothing",
            "imageUrl": "https://picsum.photos/200/300?random=201"
          },
          {
            "id": 202,
            "name": "Women's Clothing",
            "imageUrl": "https://picsum.photos/200/300?random=202"
          },
          {
            "id": 203,
            "name": "Footwear",
            "imageUrl": "https://picsum.photos/200/300?random=203"
          },
          {
            "id": 204,
            "name": "Accessories",
            "imageUrl": "https://picsum.photos/200/300?random=204"
          },
          {
            "id": 205,
            "name": "Jewelry",
            "imageUrl": "https://picsum.photos/200/300?random=205"
          }
        ]
      },
      {
        "id": 3,
        "name": "Home & Kitchen",
        "imageUrl": "https://picsum.photos/200/300?random=3",
        "subCategories": [
          {
            "id": 301,
            "name": "Furniture",
            "imageUrl": "https://picsum.photos/200/300?random=301"
          },
          {
            "id": 302,
            "name": "Kitchen Appliances",
            "imageUrl": "https://picsum.photos/200/300?random=302"
          },
          {
            "id": 303,
            "name": "Bedding",
            "imageUrl": "https://picsum.photos/200/300?random=303"
          },
          {
            "id": 304,
            "name": "Lighting",
            "imageUrl": "https://picsum.photos/200/300?random=304"
          },
          {
            "id": 305,
            "name": "Decor",
            "imageUrl": "https://picsum.photos/200/300?random=305"
          }
        ]
      },
      {
        "id": 4,
        "name": "Books",
        "imageUrl": "https://picsum.photos/200/300?random=4",
        "subCategories": [
          {
            "id": 401,
            "name": "Fiction",
            "imageUrl": "https://picsum.photos/200/300?random=401"
          },
          {
            "id": 402,
            "name": "Non-Fiction",
            "imageUrl": "https://picsum.photos/200/300?random=402"
          },
          {
            "id": 403,
            "name": "Science",
            "imageUrl": "https://picsum.photos/200/300?random=403"
          },
          {
            "id": 404,
            "name": "History",
            "imageUrl": "https://picsum.photos/200/300?random=404"
          },
          {
            "id": 405,
            "name": "Biography",
            "imageUrl": "https://picsum.photos/200/300?random=405"
          },

          // //-----------
          {
            "id": 501,
            "name": "Action Figures",
            "imageUrl": "https://picsum.photos/200/300?random=501"
          },
          {
            "id": 502,
            "name": "Board Games",
            "imageUrl": "https://picsum.photos/200/300?random=502"
          },
          {
            "id": 503,
            "name": "Puzzles",
            "imageUrl": "https://picsum.photos/200/300?random=503"
          },
          {
            "id": 504,
            "name": "Dolls",
            "imageUrl": "https://picsum.photos/200/300?random=504"
          },
          {
            "id": 505,
            "name": "Building Blocks",
            "imageUrl": "https://picsum.photos/200/300?random=505"
          }
        ]
      },
      {
        "id": 5,
        "name": "Toys & Games",
        "imageUrl": "https://picsum.photos/200/300?random=5",
        "subCategories": []
      },
      {
        "id": 6,
        "name": "Sports & Outdoors",
        "imageUrl": "https://picsum.photos/200/300?random=6",
        "subCategories": [
          {
            "id": 601,
            "name": "Camping",
            "imageUrl": "https://picsum.photos/200/300?random=601"
          },
          {
            "id": 602,
            "name": "Cycling",
            "imageUrl": "https://picsum.photos/200/300?random=602"
          },
          {
            "id": 603,
            "name": "Running",
            "imageUrl": "https://picsum.photos/200/300?random=603"
          },
          {
            "id": 604,
            "name": "Football",
            "imageUrl": "https://picsum.photos/200/300?random=604"
          },
          {
            "id": 605,
            "name": "Swimming",
            "imageUrl": "https://picsum.photos/200/300?random=605"
          }
        ]
      },
      {
        "id": 7,
        "name": "Automotive",
        "imageUrl": "https://picsum.photos/200/300?random=7",
        "subCategories": [
          {
            "id": 701,
            "name": "Car Accessories",
            "imageUrl": "https://picsum.photos/200/300?random=701"
          },
          {
            "id": 702,
            "name": "Motorcycles",
            "imageUrl": "https://picsum.photos/200/300?random=702"
          },
          {
            "id": 703,
            "name": "Car Parts",
            "imageUrl": "https://picsum.photos/200/300?random=703"
          },
          {
            "id": 704,
            "name": "Tires",
            "imageUrl": "https://picsum.photos/200/300?random=704"
          },
          {
            "id": 705,
            "name": "Tools",
            "imageUrl": "https://picsum.photos/200/300?random=705"
          }
        ]
      },
      {
        "id": 8,
        "name": "Health & Personal Care",
        "imageUrl": "https://picsum.photos/200/300?random=8",
        "subCategories": [
          {
            "id": 801,
            "name": "Vitamins & Supplements",
            "imageUrl": "https://picsum.photos/200/300?random=801"
          },
          {
            "id": 802,
            "name": "Personal Care",
            "imageUrl": "https://picsum.photos/200/300?random=802"
          },
          {
            "id": 803,
            "name": "Health Devices",
            "imageUrl": "https://picsum.photos/200/300?random=803"
          },
          {
            "id": 804,
            "name": "First Aid",
            "imageUrl": "https://picsum.photos/200/300?random=804"
          },
          {
            "id": 805,
            "name": "Skin Care",
            "imageUrl": "https://picsum.photos/200/300?random=805"
          }
        ]
      },
      {
        "id": 9,
        "name": "Groceries",
        "imageUrl": "https://picsum.photos/200/300?random=9",
        "subCategories": [
          {
            "id": 901,
            "name": "Fresh Produce",
            "imageUrl": "https://picsum.photos/200/300?random=901"
          },
          {
            "id": 902,
            "name": "Snacks",
            "imageUrl": "https://picsum.photos/200/300?random=902"
          },
          {
            "id": 903,
            "name": "Dairy",
            "imageUrl": "https://picsum.photos/200/300?random=903"
          },
          {
            "id": 904,
            "name": "Beverages",
            "imageUrl": "https://picsum.photos/200/300?random=904"
          },
          {
            "id": 905,
            "name": "Canned Goods",
            "imageUrl": "https://picsum.photos/200/300?random=905"
          }
        ]
      },
      {
        "id": 10,
        "name": "Music",
        "imageUrl": "https://picsum.photos/200/300?random=10",
        "subCategories": [
          {
            "id": 1001,
            "name": "Rock",
            "imageUrl": "https://picsum.photos/200/300?random=1001"
          },
          {
            "id": 1002,
            "name": "Pop",
            "imageUrl": "https://picsum.photos/200/300?random=1002"
          },
          {
            "id": 1003,
            "name": "Jazz",
            "imageUrl": "https://picsum.photos/200/300?random=1003"
          },
          {
            "id": 1004,
            "name": "Classical",
            "imageUrl": "https://picsum.photos/200/300?random=1004"
          },
          {
            "id": 1005,
            "name": "Hip-Hop",
            "imageUrl": "https://picsum.photos/200/300?random=1005"
          }
        ]
      }
    ]
  };

  void scrollToSelectedSubCategoriesItem(int index) {
    subCategoriesCurrentIndex.value = index;

    // Get the item height and the screen height
    double itemWidth = 80.w; // Assuming each item is 80px tall
    double screenWidth = Get.size.width;

    // Calculate the offset to scroll the item to the center of the screen
    double offset = itemWidth * index - (screenWidth / 14) + (itemWidth / 2);

    // Scroll to the calculated position
    scrollSubCategoriesCtrl.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollToSelectedCategoriesItem(int index) {
    categoriesCurrentIndex.value = index;

    // Get the item height and the screen height
    double itemHeight = 80.h; // Assuming each item is 80px tall
    double screenHeight = Get.size.height;

    // Calculate the offset to scroll the item to the center of the screen
    double offset = itemHeight * index - (screenHeight / 8) + (itemHeight / 2);

    // Scroll to the calculated position
    scrollCategoriesCtrl.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  RxBool isLoad = true.obs;
  Future<bool> loader() async {
    await Future.delayed(const Duration(seconds: 2), () {
      isLoad.value = false;
      update();
    });
    print(isLoad.value);
    return isLoad.value;
  }

  @override
  void onInit() {
    loader();
    String jsonString = jsonEncode(categories);
    if (kDebugMode) {
      print(jsonString);
    }
    categoriesResp.value = categoriesModelFromJson(jsonString);
    super.onInit();
  }

  @override
  void dispose() {
    scrollCategoriesCtrl.dispose();
    scrollSubCategoriesCtrl.dispose();
    super.dispose();
  }
}
