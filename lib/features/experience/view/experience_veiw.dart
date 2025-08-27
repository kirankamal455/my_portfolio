import 'package:animated_digit/animated_digit.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/features/dashboard/view/dashboard_page.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';
import 'package:kiran_portfolio/shared/widget/custom_text_heading.dart';
import 'package:kiran_portfolio/shared/widget/hover_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 30,
          spacing: 40,
          children: const [
            StatCard(
              value: 3,
              label: "Years Experience",
            ),

            StatCard(
              value: 421,
              label: "Clients Worldwide",
            ),

            StatCard(
              value: 10,
              label: "Completed Projects",
            ),
          ],
        ),
      ),
    ).pSymmetric(v: 20, h: 10);
  }
}

class StatCard extends StatelessWidget {
  final num value;
  final String label;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return  HoverCard(
        cardId: label,
        child:GlassCardSample(
      height: 220,
      width: 478,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        decoration: BoxDecoration(
          // color: const Color(0xFF0D1B0D), // Dark green/blackish tone
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // AnimatedFlipCounter(
              //   duration: Duration(milliseconds: 2000),
              //   textStyle: TextStyle(fontSize: 70),
              //   suffix:  "+",
              //   value: value, // pass in a value like 2014
              // ),
              AnimatedDigitWidget( duration:   Duration(milliseconds: 2000),
                  textStyle: TextStyle(fontSize: 60,fontWeight: FontWeight.bold, color: Colors.white),
                  suffix: "+" ,
                  value: value),
              // Text(
              //   value,
              //   style: const TextStyle(
              //     fontSize: 40,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ),
      ),
        ) ).fadeInUp();
  }
}
