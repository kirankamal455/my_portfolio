import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/shared/widget/custom_app_bar.dart';
import 'package:kiran_portfolio/shared/widget/drawer_menu.dart';
import 'package:kiran_portfolio/shared/widget/glass_card.dart';
import 'package:selectable/selectable.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../shared/widget/gradient_ball.dart';

class NeonGradientBackground extends StatelessWidget {
  final Widget child;
  const NeonGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// --- Gradient Glow Layer ---
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ],
                radius: 1.5,
                center: Alignment.center,
              ),
            ),
          ),

          /// --- Neon Blobs (like blue/pink/orange gradients) ---
          Positioned(
            top: -100,
            left: -100,
            child: _glowCircle(const Color(0xFF00FFFF).withOpacity(0.6), 300),
          ),
          Positioned(
            bottom: -120,
            right: -80,
            child: _glowCircle(const Color(0xFFFF00FF).withOpacity(0.5), 350),
          ),
          Positioned(
            top: 150,
            right: 200,
            child: _glowCircle(const Color(0xFFFF8C00).withOpacity(0.4), 200),
          ),

          /// --- Blur overlay for smooth glass effect ---
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),

          /// --- Child widget (e.g., your portfolio content) ---
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _glowCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
          stops: const [0.1, 1.0],
        ),
      ),
    );
  }
}
