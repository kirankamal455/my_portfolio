import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

extension FadeWidget on Widget {
  Widget fadeInUp({Duration? duration, double? offset}) => FadeInUp(
        config: BaseAnimationConfig(
          delay: const Duration(milliseconds: 200), // wait 0.2s before starting
          duration: const Duration(milliseconds: 600), // animation lasts 0.6s
          child: this,
        ),
      );

  Widget fadeInRight({int milliseconds = 0, double? offset}) => FadeInRight(
        config: BaseAnimationConfig(
          delay: const Duration(milliseconds: 200), // wait 0.2s before starting
          duration: const Duration(milliseconds: 600), // animation lasts 0.6s
          child: this,
        ),
      );
  Widget fadeInDown({int milliseconds = 0, double? offset}) => FadeInDown(
        config: BaseAnimationConfig(
          delay: const Duration(milliseconds: 200), // wait 0.2s before starting
          duration: const Duration(milliseconds: 600), // animation lasts 0.6s
          child: this,
        ),
      );
  Widget fadeInLeft({int milliseconds = 0, double? offset}) => FadeInLeft(
        config: BaseAnimationConfig(
          delay: const Duration(milliseconds: 200), // wait 0.2s before starting
          duration: const Duration(milliseconds: 600), // animation lasts 0.6s
          child: this,
        ),
      );
}
