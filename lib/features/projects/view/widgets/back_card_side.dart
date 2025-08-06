import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BackCardSide extends StatelessWidget {
  final String ProjectName;
  const BackCardSide({super.key, required this.ProjectName});

  @override
  Widget build(BuildContext context) {
    return VxBox(child: ProjectName.text.bold.white.make().centered())
        .color(Colors.blue)
        .make();
  }
}
