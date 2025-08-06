import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class FrontCardSide extends StatelessWidget {
  final String ProjectDescription;
  const FrontCardSide({super.key, required this.ProjectDescription});

  @override
  Widget build(BuildContext context) {
    return VxBox(child: ProjectDescription.text.bold.white.make().centered())
        .color(Colors.green)
        .make();
  }
}
