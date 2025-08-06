import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';


extension FadeWidget on Widget {
  Widget fadeInUp({Duration? duration, double? offset}) =>  FadeIn(
    config: BaseAnimationConfig(
        child: this
    ),
  );

  Widget fadeInRight({int milliseconds = 0, double? offset}) => FadeIn(
    config: BaseAnimationConfig(
        child: this
    ),
  );
  Widget fadeInDown({int milliseconds = 0, double? offset}) =>FadeIn(
    config: BaseAnimationConfig(
        child: this
    ),
  );
  Widget fadeInLeft({int milliseconds = 0, double? offset}) => FadeIn(
    config: BaseAnimationConfig(
        child: this
    ),
  );
}
