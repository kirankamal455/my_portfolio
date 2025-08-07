import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/interest_selection_pod.dart';

class CutomIntresetWidget extends ConsumerWidget {
  final String intresetName;
  const CutomIntresetWidget({super.key, required this.intresetName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onIntrestHover = ref.watch(intrestHoverSelectionPod(intresetName));
    return InkWell(
      onHover: (value) {
        ref
            .read(intrestHoverSelectionPod(intresetName).notifier)
            .update((state) => value);
      },
      onTap: () {},
      child: intresetName.text.bold
          //.color(onIntrestHover ? Colors.white : context.primaryColor)
          .make()
          .p(8)
          .box
         // .border(color: context.primaryColor)
          .withRounded(value: 10)
          .color(onIntrestHover ? context.primaryColor : Colors.black54)
          .make(),
    );
  }
}
