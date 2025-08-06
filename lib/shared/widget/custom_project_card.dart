import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../features/dashboard/view/dashboard_page.dart';
import '../../features/projects/controller/project_details_pod.dart';

class AeonWalletCard extends ConsumerWidget {
  final int cardId;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techChips;
  final List<String> features;
  final String downloads;
  final String platform;
  final double rating;
  final VoidCallback? onLiveDemo;

  const AeonWalletCard({
    super.key,
    required this.cardId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techChips,
    required this.features,
    required this.downloads,
    required this.platform,
    required this.rating,
    this.onLiveDemo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(hoverPod(cardId));
    final hoverController = ref.read(hoverPod(cardId).notifier);

    return MouseRegion(
        onEnter: (_) => hoverController.state = true,
        onExit: (_) => hoverController.state = false,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            transform: isHovered
                ? (Matrix4.identity()..scale(1.04))
                : Matrix4.identity(),
            // transform: _isHovered
            //     ? (Matrix4.identity()
            //       ..scale(1.1)
            //       ..rotateZ(0.1))
            //     : Matrix4.identity(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: VStack([
              GlassCardSample(
                height: 700,
                width: 400,
                child: VStack([
                  // Top Image with rounded top corners
                  VxBox()
                      .height(300)
                      .withDecoration(BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ))
                      .make(),

                  // Content Section
                  VStack([
                    title.text.xl2.semiBold.color(Vx.purple600).make(),

                    description.text.sm.make().py4(),

                    // Wrap(
                    //   spacing: 8,
                    //   runSpacing: 4,
                    //   children: techChips.map((chip) => _buildChip(chip)).toList(),
                    // ).py8(),

                    VStack([
                      "Key Features:".text.bold.make(),
                      ...features.map((f) => "• $f".text.make()),
                    ]).py8(),

                    HStack([
                      const Icon(Icons.download, size: 16),
                      " ${downloads}".text.sm.make(),
                    ]).py4(),

                    HStack([
                      const Icon(Icons.android, color: Vx.green500),
                      " ${platform}".text.make(),
                    ]).py4(),

                    HStack([
                      const Icon(Icons.star, color: Colors.amber),
                      " ${rating}".text.make(),
                      const Spacer(),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Vx.pink500,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: onLiveDemo,
                        icon: const Icon(Icons.link),
                        label: "Live Demo".text.white.make(),
                      ),
                    ]).py8(),
                  ])
                      .p24()
                      .box
                      //  .color(Vx.gray100)
                      //.withRounded(bottomLeft: 20, bottomRight: 20)
                      .make(),
                ]),
              ),
            ]).p32()));
  }
}
