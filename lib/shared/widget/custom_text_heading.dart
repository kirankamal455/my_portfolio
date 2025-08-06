import 'package:flutter/material.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';

import 'package:velocity_x/velocity_x.dart';

class CustomSectionHeading extends StatelessWidget {
  final String headingName;

  const CustomSectionHeading({
    super.key,
    required this.headingName,
  });

  @override
  Widget build(BuildContext context) {
    return headingName.text.bold
        .size(40)
        .fontFamily(FontFamily.montserrat)
        .make();
    // .fadeInUp();
  }
}
