import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiran_portfolio/data/provider/data_provider.dart';
import 'package:kiran_portfolio/features/services/view/widgets/custom_service_card.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../data/model/user_profile_response_model.dart';
import '../../../shared/widget/custom_text_heading.dart';
import '../controller/service_card_hover_pod.dart';

class ServicesPage extends StatelessWidget {
  final UserProfileResponseModel userProfileResponseModel;
  const ServicesPage({super.key, required this.userProfileResponseModel});

  @override
  Widget build(BuildContext context) {
    return [
      const CustomSectionHeading(headingName: "What I Can do ?").fadeInUp(),

      VxBox(
              child: Consumer(
        builder: (context, ref, child) {
          final data = ref.watch(serviceDetailsPod);
          final services = ref.watch(profileProvider);
          return ResponsiveBreakpoints.of(context).smallerThan(MOBILE)
              ? CarouselSlider.builder(
                  options: CarouselOptions(autoPlay: true),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      CustomServiceCardCard(
                    tittle: data[itemIndex].tittle,
                    imagePath: data[itemIndex].imagePath,
                  ),
                )
              : Wrap(
                  direction: Axis.horizontal,
                  spacing: 16, // space between items
                  runSpacing: 16, // space between rows if wrapped
                  children: [
                    ...services.services.map(
                      (e) => CustomServiceCardCard(
                        tittle: e. label,
                        imagePath: e.icon,
                      ).fadeInRight(),
                    )
                    // CustomServiceCardCard(
                    //   tittle: "Mobile App Development",
                    //   imagePath: MyAssets.images.serviceImages.mobileApp.path,
                    // ),
                    // CustomServiceCardCard(
                    //   tittle: "UI/UX Designing",
                    //   imagePath: MyAssets.images.serviceImages.uiUx.path,
                    // ),
                    // CustomServiceCardCard(
                    //   tittle: "Open source - Github",
                    //   imagePath: MyAssets.images.serviceImages.opensource.path,
                    // ),
                    // CustomServiceCardCard(
                    //   tittle: "Rapid Prototyping",
                    //   imagePath: MyAssets.images.serviceImages.prototyping.path,
                    // ),
                    // CustomServiceCardCard(
                    //   tittle: "Rest Apis",
                    //   imagePath: MyAssets.images.serviceImages.api.path,
                    // ),
                  ],
                );
        },
      ).pOnly(top: 50))
          .make()

      //.pSymmetric(h: 150).pSymmetric(v: 40)
    ].vStack().pSymmetric(v: 80);
  }
}
