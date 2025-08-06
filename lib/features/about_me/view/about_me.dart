import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/core/gen/assets.gen.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../shared/widget/custom_text_heading.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      const CustomSectionHeading(headingName: "About Me"),
      const Gap(50),
      // [

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ResponsiveRowColumn(
          columnSpacing: 10,
          rowSpacing: 60,
          layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
              ? ResponsiveRowColumnType.COLUMN
              : ResponsiveRowColumnType.ROW,
          rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                ? ResponsiveRowColumnItem(
                    child: VxBox(
                        child: Image.asset(
                      MyAssets.images.profileSide.path,
                      height: 500,
                    )).height(500).width(400).make()
                    
                    //.fadeInLeft(),
                  )
                : const ResponsiveRowColumnItem(child: SizedBox.shrink()),
            ResponsiveRowColumnItem(
                rowFlex: 1,
                rowFit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Who am I?".text.xl3.make(),
                    "I'm Kiran kamal ,a Flutter developer,Ui dessigner"
                        .text
                        .xl4
                        .bold
                        .fontFamily(FontFamily.poppins)
                        .align(TextAlign.justify)
                        .make()
                        .pOnly(top: 15),
                    "I'm a B-Tech graduate with Infomation Technology. I have been developing mobile apps for over 1.8 years now \nAs a Flutter developer, I specialize in building cross-platform applications that run smoothly on both Android and iOS devices, leveraging the power of Google's versatile UI toolkit. My expertise extends beyond mere functionality; I thrive on designing visually stunning user interfaces that not only captivate users but also enhance their interaction with the app."
                        .text
                        .xl2
                        .fontFamily(FontFamily.montserrat)
                        .align(TextAlign.justify)
                        .make()
                        .pOnly(top: 15)
                  ],
                )
                //.fadeInRight(),
                ),
          ],
        ),
      )

      // const Gap(100),
      // FadeInRight(
      //         delay: 0.ms,
      //         duration: const Duration(milliseconds: 1400),
      //         curves: Curves.easeOut,
      //         offset: 450,
      //         globalKey: GlobalKey(),
      //         child: [
      //           RichText(
      //             text: const TextSpan(
      //               children: [
      //                 TextSpan(text: "Who am I? "),
      //                 TextSpan(
      //                     text:
      //                         "I'm Kiran kamal ,a Flutter developer,Ui designer",
      //                     style: TextStyle(
      //                         fontSize: 24,
      //                         fontFamily: FontFamily.poppins,
      //                         fontWeight: FontWeight.bold)),
      //               ],
      //             ),
      //           )
      // "Who am I?".text.xl3.make(),
      // "I'm Kiran kamal ,a Flutter developer,Ui designer"
      //     .text
      //     .xl4
      //     .bold
      //     .fontFamily(FontFamily.poppins)
      //     .make()
      //     .pSymmetric(v: 9),
      // "I'm a B-Tech graduate with Infomation Technology. I have been developing mobile apps for over 1.8 years now \nAs a Flutter developer, I specialize in building cross-platform applications that run smoothly on both Android and iOS devices, leveraging the power of Google's versatile UI toolkit. My expertise extends beyond mere functionality; I thrive on designing visually stunning user interfaces that not only captivate users but also enhance their interaction with the app."
      //     .text
      //     .xl2
      //     .fontFamily(FontFamily.montserrat)
      //     .make()
      //     .box
      //     .make()
      //     .flexible(),
      // const Gap(30),
      // [
      //   const Text.rich(
      //     TextSpan(
      //       children: [
      //         TextSpan(
      //           text: "Name :",
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontFamily: FontFamily.montserrat),
      //         ),
      //         TextSpan(
      //           text: " Kiran Kamal",
      //           style: TextStyle(fontFamily: FontFamily.montserrat),
      //         )
      //       ],
      //     ),
      //   ),
      //   const Text.rich(
      //     TextSpan(
      //       children: [
      //         TextSpan(
      //           text: "Email :",
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontFamily: FontFamily.montserrat),
      //         ),
      //         TextSpan(
      //           text: "Kirankamal45@gmail.com",
      //           style: TextStyle(fontFamily: FontFamily.montserrat),
      //         )
      //       ],
      //     ),
      //   )
      // ].hStack(alignment: MainAxisAlignment.spaceBetween),
      // const Gap(20),
      // [
      //   const Text.rich(
      //     TextSpan(
      //       children: [
      //         TextSpan(
      //           text: "Age :",
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontFamily: FontFamily.montserrat),
      //         ),
      //         TextSpan(
      //           text: " 24",
      //           style: TextStyle(fontFamily: FontFamily.montserrat),
      //         )
      //       ],
      //     ),
      //   ),
      //   const Gap(30),
      //   const Text.rich(
      //     TextSpan(
      //       children: [
      //         TextSpan(
      //           text: "From :",
      //           style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontFamily: FontFamily.montserrat),
      //         ),
      //         TextSpan(
      //           text: "Pathanamthitta,kerala",
      //           style: TextStyle(fontFamily: FontFamily.montserrat),
      //         )
      //       ],
      //     ),
      //   )
      // ].hStack(alignment: MainAxisAlignment.spaceBetween)
      //         ].vStack(
      //             crossAlignment: CrossAxisAlignment.start,
      //             alignment: MainAxisAlignment.start))
      //     .p(20)
      //     .box
      //     .height(500)
      //     .width(750)
      //     .make()
      //     .flexible(),
      // ]
      //     .hStack(
      //       crossAlignment: CrossAxisAlignment.start,
      //     )
      //     .pSymmetric(h: 180)
    ].vStack().box.make().p(20);
  }
}
