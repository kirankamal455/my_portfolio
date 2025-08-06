import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return VxBox(
            child: "©All Right Reservered by Kiran Kamal"
                .text
                .white
                .make()
                .objectCenter())
        .color(context.isDarkMode?Colors.black:  const Color(0xff331C52))
        .height(context.screenHeight * 0.10)
        .make()
        .pOnly(top: 20);
  }
}
