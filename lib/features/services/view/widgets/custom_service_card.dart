import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../../core/gen/fonts.gen.dart';
import '../../../dashboard/view/dashboard_page.dart';
import '../../controller/service_card_hover_pod.dart';

class CustomServiceCardCard extends ConsumerWidget {
  final String tittle;
  final String imagePath;
  const CustomServiceCardCard({
    required this.imagePath,
    super.key,
    required this.tittle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (isHovering) {
        if (isHovering) {
          ref
              .read(serviceCardHoverPod(tittle).notifier)
              .update((state) => true);
        } else {
          ref.invalidate(serviceCardHoverPod);
        }
      },
      child: Consumer(
        builder: (_, WidgetRef ref, __) {
          final isHover = ref.watch(serviceCardHoverPod(tittle));
          return GlassCardSample(
            height: 200,
            width: 300,
            child: [
              VxBox(child: Image.asset(imagePath)).height(50).width(50).make(),
              const Gap(10),
              tittle.text.xl.bold
                  .fontFamily(FontFamily.montserrat)
                  .make()
                  .pSymmetric(v: 5),
            ].vStack(alignment: MainAxisAlignment.center),
            // )
          );
        },
      ),
    ).pSymmetric(v: 10);
  }
}
