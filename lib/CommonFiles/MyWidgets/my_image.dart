import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopeymart/CommonFiles/app_double.dart';
import 'package:shopeymart/CommonFiles/image_strings.dart';

class MyImage extends StatefulWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double scale;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? errorImageWidth;
  final double? errorImageHeight;
  final ImageWidgetBuilder? imageBuilder;
  const MyImage({
    super.key,
    required this.imageUrl,
    this.fit,
    this.scale = 1.0,
    this.width,
    this.height,
    this.imageBuilder,
    this.imageWidth,
    this.imageHeight,
    this.errorImageWidth,
    this.errorImageHeight,
  });

  @override
  State<MyImage> createState() => _MyImageState();
}

class _MyImageState extends State<MyImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: widget.fit,
      scale: widget.scale,
      width: widget.width,
      height: widget.height,
      imageBuilder: widget.imageBuilder,
      placeholder: (context, url) => Container(
        alignment: Alignment.center,
        width: widget.imageWidth ?? MediaQuery.of(context).size.width,
        height: widget.imageHeight ?? MediaQuery.of(context).size.height / 3.h,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Container(
        alignment: Alignment.center,
        width: widget.errorImageWidth ?? MediaQuery.of(context).size.width,
        height:
            widget.errorImageHeight ?? MediaQuery.of(context).size.height / 3.h,
        child: Image.asset(
          ImageStrings.noImagePlaceholder,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
