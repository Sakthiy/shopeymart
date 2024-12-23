import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/dimensions.dart';
import 'package:shopeymart/CommonFiles/my-text-style.dart';
import 'package:shopeymart/UI/Search/controllers/search_controller.dart';
import 'package:shopeymart/UI/search/controllers/search_controller.dart';

class FilterWidget extends StatelessWidget {
  final double? maxValue;
  final bool isStore;
  const FilterWidget({super.key, required this.maxValue, required this.isStore});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDouble.double8)),
      insetPadding: const EdgeInsets.all(30),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: 600,
        padding: EdgeInsets.all(AppDouble.double8),
        child: const Text('Sakthy')),
    );
  }
}
