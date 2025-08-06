import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomSocialMediaIcons extends StatelessWidget {
  final String assetName;

  const CustomSocialMediaIcons({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(assetName),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
