
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemViewWidget extends StatelessWidget {
  final bool isItem;
  const ItemViewWidget({super.key, required this.isItem});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('data')
    );
  }
}
