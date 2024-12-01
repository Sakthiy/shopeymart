import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopeymart/CommonFiles/my_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vibration/vibration.dart';

class BannerImages extends StatefulWidget {
  final List bannerImageList;
  final double? height;
  final bool? autoPlay;
  final bool? isVibration;
  final bool? pauseAutoPlayOnTouch;
  final Color? backgroundColor;
  final Color? dotBackgroundColor;
  final double? imageRadius;
  final Curve? imageSliderAnimation;
  final double? imageHorizontalPadding;
  final double? viewportFraction;
  final double? dotHeight;
  final double? dotWidth;
  final double? expansionFactor;
  final double? bottomPadding;
  final double? indicatorDownPadding;
  final Color? dotColor;
  final Color? activeDotColor;
  final AlignmentGeometry? dotIndicator;
  const BannerImages({
    super.key,
    required this.bannerImageList,
    this.height,
    this.autoPlay,
    this.isVibration = false,
    this.backgroundColor,
    this.imageRadius,
    this.imageSliderAnimation,
    this.imageHorizontalPadding,
    this.viewportFraction,
    this.dotHeight,
    this.dotWidth,
    this.expansionFactor,
    this.activeDotColor,
    this.dotColor,
    this.pauseAutoPlayOnTouch,
    this.dotBackgroundColor,
    this.dotIndicator,
    this.bottomPadding,
    this.indicatorDownPadding,
  });

  @override
  State<BannerImages> createState() => _BannerImagesState();
}

class _BannerImagesState extends State<BannerImages> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.dotIndicator ?? Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: widget.indicatorDownPadding ?? 0.0),
          child: CarouselSlider(
            items: widget.bannerImageList
                .map(
                  (bImage) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.imageHorizontalPadding ?? 5.0,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: bImage,
                      errorWidget: (context, url, error) => Image.asset(
                        'images/placeholder.jpg',
                        fit: BoxFit.cover,
                      ),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          color: widget.backgroundColor ?? Colors.white,
                          borderRadius:
                              BorderRadius.circular(widget.imageRadius ?? 15.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            // scale: 2,
                            image: imageProvider,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
                if (widget.isVibration!) {
                  Vibration.vibrate(duration: 30);
                }
              },
              height: widget.height ?? 160.0,
              pauseAutoPlayOnTouch: widget.pauseAutoPlayOnTouch ?? true,
              autoPlay: widget.autoPlay ?? false,
              viewportFraction: widget.viewportFraction ?? 0.88,
              autoPlayCurve: widget.imageSliderAnimation ?? Curves.easeOut,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 10.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 13.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: widget.dotBackgroundColor ?? Colors.black54,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.bannerImageList.length,
              effect: ExpandingDotsEffect(
                dotHeight: widget.dotHeight ?? 7,
                dotColor: widget.dotColor ?? Colors.white70,
                activeDotColor: widget.activeDotColor ?? MyColors.primaryColor,
                dotWidth: widget.dotWidth ?? 7,
                expansionFactor: widget.expansionFactor ?? 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
