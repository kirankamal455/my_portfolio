import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const GlassCard({
    super.key,
    required this.child,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      child: child,
      blur: 5,
      width: width,
      height: height,
      color: Colors.white.withOpacity(0.15),
      padding: const EdgeInsets.all(8),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
    );
  }
}
