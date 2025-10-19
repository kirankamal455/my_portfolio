import 'dart:ui';
import 'package:flutter/material.dart';
class BackgroundPainter extends CustomPainter {
  final double offset;

  BackgroundPainter({required this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.purple, Colors.indigo, Colors.blueAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawCircle(
        Offset(size.width * 0.3 + offset, size.height * 0.4), 200, paint);
    canvas.drawCircle(
        Offset(size.width * 0.7 - offset, size.height * 0.6), 150, paint);
  }

  @override
  bool shouldRepaint(covariant BackgroundPainter oldDelegate) => true;
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key, required behaviour});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(duration: const Duration(seconds: 20), vsync: this)
      ..repeat(reverse: true);

    _animation = Tween(
      begin: -100.0,
      end: 100.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
            painter: BackgroundPainter(offset: _animation.value));
      },
    );
  }
}