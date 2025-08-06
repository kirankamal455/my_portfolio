import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hovering/hovering.dart';

import 'package:velocity_x/velocity_x.dart';

import '../../../../core/gen/fonts.gen.dart';
import '../../../dashboard/view/dashboard_page.dart';
import '../../controller/contact_controller_pod.dart';

class CustomContactCard extends ConsumerWidget {
  final IconData icon;
  final String tittle;
  final String subtittle;
  const CustomContactCard({
    super.key,
    required this.icon,
    required this.tittle,
    required this.subtittle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GlassCardSample(
      height: 230,
      width: 300,
      child: InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        onHover: (isHovering) {
          if (isHovering) {
            ref.read(cardSelectPod(tittle).notifier).update((state) => true);
          } else {
            ref.invalidate(cardSelectPod);
          }
        },
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final isHover = ref.watch(cardSelectPod(tittle));
            return Container(
              decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  // boxShadow: [
                  //   isHover
                  //       ? BoxShadow(
                  //           color: context.primaryColor,
                  //           blurRadius: 12.0,
                  //           offset: const Offset(0.0, 0.0),
                  //         )
                  //       : BoxShadow(
                  //           color: Colors.black.withAlpha(100),
                  //           blurRadius: 0,
                  //           offset: const Offset(0.0, 0.0),
                  //         )
                  // ]
               ),
              child: [
                Icon(
                  icon,
                  size: 50,
                ),
                const Gap(10),
                tittle.text.xl.bold
                    .fontFamily(FontFamily.montserrat)
                    .make()
                    .pSymmetric(v: 5),
                subtittle.text.fontFamily(FontFamily.montserrat).make()
              ].vStack(alignment: MainAxisAlignment.center).p(15),
            );
          },
        ).h(200).w(320).p(10),
      ),
    ).pSymmetric(v: 10);
  }
}
