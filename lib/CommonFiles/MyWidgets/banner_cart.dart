import 'package:flutter/material.dart';
import 'banner_images.dart';

class BannerCart extends StatefulWidget {
  final List bannerImage;
  final bool isFirstCart;
  const BannerCart({
    super.key,
    required this.bannerImage,
    required this.isFirstCart,
  });

  @override
  State<BannerCart> createState() => _BannerCartState();
}

class _BannerCartState extends State<BannerCart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BannerImages(
              bannerImageList: widget.bannerImage,
              height: 350,
              viewportFraction: 1,
              bottomPadding: 80,
              imageRadius: 0,
              imageHorizontalPadding: 0,
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    // MyColors.primaryColor.withOpacity(0),
                    // MyColors.primaryColor.shade100,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 280.0),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const SizedBox(
                width: 135,
                child: Card(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
