import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';
import 'package:kiran_portfolio/features/talk_with_me/view/widgets/custom_interest_widget.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';
import 'package:kiran_portfolio/shared/widget/glass_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../dashboard/view/dashboard_page.dart';

class TalkWithMePage extends StatelessWidget {
  const TalkWithMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      // height:
      //     ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 890 : 500,
      width: context.screenWidth * 0.86,
      child: ResponsiveRowColumn(
        columnSpacing: 30,
        layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
            ? ResponsiveRowColumnType.COLUMN
            : ResponsiveRowColumnType.ROW,
        rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        rowCrossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ResponsiveRowColumnItem(
            child: [
              AnimatedTextKit(
                totalRepeatCount: 4,
                repeatForever: false,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Lets discuss\non something cool together',
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: Theme.of(context).brightness == Brightness.dark
                        ? [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.grey,  // Silver color for dark mode
                    ]
                        : [
                      Colors.purple,
                      Colors.blue,
                      Colors.yellow,
                      Colors.white, // Original color for light mode
                    ],
                  )

                ],
                isRepeatingAnimation: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
              //.fadeInUp(),
              const Gap(60),
              "I'm interested in.."
                  .text
                  .bold
                  .color(
                      context.isDarkMode ? Colors.white : context.primaryColor)
                  .make(),
              const Gap(20),
              const Wrap(
                runSpacing: 15,
                spacing: 8,
                children: [
                  CutomIntresetWidget(intresetName: "Mobile Development"),
                  CutomIntresetWidget(intresetName: "Flutter Web"),
                  CutomIntresetWidget(intresetName: "Backend Development"),
                  CutomIntresetWidget(intresetName: "Portfolio"),
                  CutomIntresetWidget(intresetName: "UI/UX"),
                  CutomIntresetWidget(intresetName: "Cloud Development")
                ],
              ).w(500)
              //.fadeInUp(),
            ]
                .vStack(crossAlignment: CrossAxisAlignment.start)
                .box
                .make()
                .fadeInLeft(),
          ),
          ResponsiveRowColumnItem(
            child: [
              const Gap(10),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: Colors.black54,
                  filled: true,
                  hintText: "Your name",
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: context.primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  fillColor: Colors.black54,
                  filled: true,
                  hintText: "Your email",
                  // border: const OutlineInputBorder(
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(7),
                  //   ),
                  // ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: context.primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const Gap(10),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                  fillColor: Colors.black54,
                  filled: true,
                  hintText: "Your message",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 0.6,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide(
                      color: context.primaryColor,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const Gap(20),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      context.isDarkMode ? Colors.white : Colors.black),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all<Size>(
                    const Size(double.infinity, 50),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                label: Text("Submit",
                    style: TextStyle(
                        color:
                            context.isDarkMode ? Colors.black : Colors.white)),
              )
            ]
                .vStack(crossAlignment: CrossAxisAlignment.stretch)
                .box
                .width(400)
                .make()
                .fadeInRight(),
          ),
        ],
      ).pSymmetric(v: 20, h: 10),
    ).pSymmetric(h: 10);
  }
}
