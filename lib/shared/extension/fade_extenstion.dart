import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

extension FadeWidget on Widget {
  Widget fadeInUp({Duration? duration, double? offset}) => FadeInUp(
    config: BaseAnimationConfig(
      useScrollForAnimation: false,
      delay: const Duration(milliseconds: 50), // shorter delay
      duration: duration ?? const Duration(milliseconds: 900),
      curves: Curves.easeOutCubic, // 👈 smoother easing
      child: this,
    ),
  );

  Widget fadeInRight({Duration? duration, double? offset}) => FadeInRight(
    config: BaseAnimationConfig(
      useScrollForAnimation: false,
      delay: const Duration(milliseconds: 50),
      duration: duration ?? const Duration(milliseconds: 900),
      curves: Curves.easeOutQuart,
      child: this,
    ),
  );

  Widget fadeInDown({Duration? duration, double? offset}) => FadeInDown(
    config: BaseAnimationConfig(
      useScrollForAnimation: false,
      delay: const Duration(milliseconds: 50),
      duration: duration ?? const Duration(milliseconds: 900),
      curves: Curves.easeOutCubic,
      child: this,
    ),
  );

  Widget fadeInLeft({Duration? duration, double? offset}) => FadeInLeft(
    config: BaseAnimationConfig(
      useScrollForAnimation: false,
      delay: const Duration(milliseconds: 50),
      duration: duration ?? const Duration(milliseconds: 900),
      curves: Curves.easeOutQuart,
      child: this,
    ),
  );
}
