import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:market_app_task/core/theme/app_colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const NetworkImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
      placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      )),
      errorWidget: (context, url, error) => const Icon(
        Icons.hide_image_outlined,
        color: AppColors.primaryColor,
      ),
    );
  }
}
