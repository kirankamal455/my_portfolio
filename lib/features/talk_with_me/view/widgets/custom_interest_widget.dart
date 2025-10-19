import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiran_portfolio/features/talk_with_me/controller/interest_selection_pod.dart';
import 'package:velocity_x/velocity_x.dart';

class CutomIntresetWidget extends ConsumerWidget {
  final String interestName;
  const CutomIntresetWidget({super.key, required this.interestName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(intrestHoverSelectionPod(interestName));
    final selectedInterests = ref.watch(selectedInterestsProvider);
    final isSelected = selectedInterests.contains(interestName);

    return InkWell(
      onHover: (hovering) {
        ref
            .read(intrestHoverSelectionPod(interestName).notifier)
            .update((state) => hovering);
      },
      onTap: () {
        final notifier = ref.read(selectedInterestsProvider.notifier);
        if (isSelected) {
          notifier.update((state) => List.from(state)..remove(interestName));
        } else {
          notifier.update((state) => [...state, interestName]);
        }
      }
      ,
      child: interestName.text.bold
          .color(
            isSelected
                ? context.isDarkMode
                    ? Colors.black
                    : Colors.white
                : context.isDarkMode
                    ? Colors.white
                    : Colors.black,
          )
          .make()
          .p(8)
          .box
          .withRounded(value: 10)
          .color(
            isHovered
                ? context.primaryColor.withOpacity(0.8)
                : isSelected
                    ? context.isDarkMode
                        ? Colors.white
                        : context.primaryColor
                    : context.isDarkMode
                        ? Colors.black54
                        : Colors.white,
          )
          .make(),
    );
  }
}
