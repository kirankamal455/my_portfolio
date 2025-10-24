import 'package:animated_digit/animated_digit.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/data/provider/data_provider.dart';
import 'package:kiran_portfolio/features/dashboard/view/dashboard_page.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';
import 'package:kiran_portfolio/shared/widget/custom_text_heading.dart';
import 'package:kiran_portfolio/shared/widget/glass_card.dart';
import 'package:kiran_portfolio/shared/widget/hover_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Experience extends ConsumerWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiance = ref.watch(profileProvider);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 30,
          spacing: 40,
          children: [
            ...experiance.experience.map(
              (e) => StatCard(
                value: e.count,
                label: e.title,
              ),
            )
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
    return HoverCard(
        cardId: label,
        child: GlassCard(
          height: 270,
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
                  AnimatedDigitWidget(
                      duration: Duration(milliseconds: 2000),
                      textStyle: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color:
                              context.isDarkMode ? Colors.white : Colors.black),
                      suffix: "+",
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
                      color: context.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )).fadeInUp();
  }
}
