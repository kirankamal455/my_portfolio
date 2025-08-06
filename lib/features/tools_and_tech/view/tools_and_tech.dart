import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:kiran_portfolio/core/gen/assets.gen.dart';
import 'package:kiran_portfolio/features/dashboard/view/dashboard_page.dart';
import 'package:kiran_portfolio/features/tools_and_tech/view/widgets/custom_square_container.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../shared/widget/custom_text_heading.dart';

class ToolsAndTech extends StatefulWidget {
  const ToolsAndTech({super.key});

  @override
  State<ToolsAndTech> createState() => _ToolsAndTechState();
}

class _ToolsAndTechState extends State<ToolsAndTech> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: [
        const CustomSectionHeading(headingName: "Tools & Tech"),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10,
          spacing: 50,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.flutter.path,
              imageName: 'Flutter',
            )
             .fadeInRight(milliseconds: 500, offset: 0 ),

            SquareWidget(
              imagePath: MyAssets.images.toolsImages.dart.path,
              imageName: 'Dart',
            )
            .fadeInRight(milliseconds: 600, offset: 50),

            SquareWidget(
              imagePath: MyAssets.images.toolsImages.python.path,
              imageName: 'Python',
            )
            //.fadeInRight(milliseconds: 700, offset: 100),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.firebase.path,
              imageName: 'Firebase',
            )
            //.fadeInRight(milliseconds: 800, offset: 150),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.git.path,
              imageName: 'Git',
            ) //.fadeInRight(milliseconds: 900, offset: 200),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.github.path,
              imageName: 'Github',
            )
            //.fadeInRight(milliseconds: 1000, offset: 250),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.aws.path,
              imageName: 'AWS',
            )
            //.fadeInRight(milliseconds: 1100, offset: 300),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.vscode.path,
              imageName: 'Vs Code',
            )
            //.fadeInRight(milliseconds: 1200, offset: 350),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.androidStudio.path,
              imageName: 'Android Studio',
            )
            //.fadeInRight(milliseconds: 1300, offset: 400),
            ,
            SquareWidget(
              imagePath: MyAssets.images.toolsImages.figma.path,
              imageName: 'Figma',
            )
            //.fadeInRight(milliseconds: 1400, offset: 450),
          ],
        ).pOnly(top: 20),
      ].vStack(),
    );
  }
}
