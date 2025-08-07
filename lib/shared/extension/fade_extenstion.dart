import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

extension FadeWidget on Widget {
  Widget fadeInUp({Duration? duration, double? offset}) => FadeInUp(
        config: BaseAnimationConfig(
            delay: Duration(
              milliseconds: 1000,
            ),
            duration: Duration(
              milliseconds: 1000,
            ),
            child: this),
      );

  Widget fadeInRight({int milliseconds = 0, double? offset}) => FadeInRight(
        config: BaseAnimationConfig(child: this),
      );
  Widget fadeInDown({int milliseconds = 0, double? offset}) => FadeInDown(
        config: BaseAnimationConfig(child: this),
      );
  Widget fadeInLeft({int milliseconds = 0, double? offset}) => FadeInLeft(
        config: BaseAnimationConfig(child: this),
      );
}
