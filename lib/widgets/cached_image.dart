import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imjanger/resources/colors.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final bool isCircular;
  final BoxFit? fit;
  final Color? filterColor;

  const CachedImage({
    super.key,
    required this.url,
    required this.height,
    required this.width,
    this.border,
    this.borderRadius,
    this.isCircular = false,
    this.fit,
    this.filterColor,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, image) {
        return Container(
          decoration: BoxDecoration(
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            border: border,
            borderRadius: borderRadius,
            image: DecorationImage(
              image: image,
              fit: fit ?? BoxFit.cover,
              colorFilter: (filterColor != null)
                  ? ColorFilter.mode(filterColor!, BlendMode.overlay)
                  : null,
            ),
          ),
        );
      },
      imageUrl: url,
      width: width,
      height: height,
      placeholder: (_, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: (isCircular == false) ? (borderRadius ?? BorderRadius.zero) : null,
          color: AppColors.gray400,
        ),
      ),
      errorWidget: (_, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: (isCircular == false) ? (borderRadius ?? BorderRadius.zero) : null,
          color: AppColors.gray400,
        ),
      ),
    );
  }
}
