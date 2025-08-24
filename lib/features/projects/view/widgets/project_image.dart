import 'package:cached_network_image/cached_network_image.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double borderRadius;

  const ProjectImage({
    super.key,
    required this.imageUrl,
    this.height = 300,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: height,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            size: 40,
            color: Colors.red,
          ),
        ),
      ),
    ).make();
  }
}
