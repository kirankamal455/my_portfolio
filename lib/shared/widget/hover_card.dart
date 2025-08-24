import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hoverPod = StateProvider.family<bool, String>((ref, cardId) => false);

class HoverCard extends ConsumerWidget {
  final String  cardId;
  final Widget child;
  final Duration duration;
  final double scale;
  final BorderRadius borderRadius;

  const HoverCard({
    super.key,
    required this.cardId,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.scale = 1.04,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(hoverPod(cardId));
    final hoverController = ref.watch(hoverPod(cardId).notifier);

    return MouseRegion(
      onEnter: (_) => hoverController.state = true,
      onExit: (_) => hoverController.state = false,
      child: AnimatedContainer(
        duration: duration,
        curve: Curves.easeOut,
        transform: isHovered
            ? (Matrix4.identity()..scale(scale))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
