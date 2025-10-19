import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

// class GlassCard extends StatelessWidget {
//   final Widget child;
//   final double height;
//   final double width;
//
//   const GlassCard({
//     super.key,
//     required this.child,
//     required this.height,
//     required this.width,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BlurryContainer(
//       child: child,
//       blur: 5,
//       width: width,
//       height: height,
//       color: Colors.white.withOpacity(0.15),
//       padding: const EdgeInsets.all(8),
//       borderRadius: const BorderRadius.all(Radius.circular(20)),
//     );
//   }
// }

class GlassCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;

  const GlassCard(
      {super.key,
       this.width,
        this.height,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.2),
                Colors.white.withValues(alpha: 0.05)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(
                color: Colors.white.withValues(alpha: 0.2), width: 1.5),
          ),
          child: child,
        ),
      ),
    );
  }
}
