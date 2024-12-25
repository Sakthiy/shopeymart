import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsCtrl extends GetxController{

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

    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}