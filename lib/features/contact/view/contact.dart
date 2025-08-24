import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/data/model/user_profile_response_model.dart';
import 'package:kiran_portfolio/features/contact/controller/contact_details_pod.dart';
import 'package:kiran_portfolio/features/contact/view/widgets/custom_contact_card.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';
import 'package:kiran_portfolio/shared/widget/custom_text_heading.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

class ContactPage extends StatelessWidget {
  final UserProfileResponseModel userProfileResponseModel;
  const ContactPage({super.key, required this.userProfileResponseModel});

  @override
  Widget build(BuildContext context) {
    return [Gap(30),
      const CustomSectionHeading(headingName: "Get in Touch").fadeInUp(),
      // "Get in Touch"
      //     .text
      //     .xl6
      //     .make()
      //     .fadeInUp(duration: const Duration(milliseconds: 1300), offset: 100),
      Gap(20),
      VxBox(child: Consumer(builder: (context, ref, child) {
        final contactDetails = ref.watch(contactDetailsPod(userProfileResponseModel));
        return ResponsiveBreakpoints.of(context).smallerThan(MOBILE)
            ? CarouselSlider.builder(
                options: CarouselOptions(autoPlay: true),
                itemCount: contactDetails.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        CustomContactCard(
                  icon: contactDetails[itemIndex].type == 0
                      ? Icons.home
                      : contactDetails[itemIndex].type == 1
                          ? Icons.phone
                          : Icons.email,
                  tittle: contactDetails[itemIndex].tittle,
                  subtittle: contactDetails[itemIndex].Subtittle,
                ),
              )
            : Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                    ...contactDetails.map(
                      (e) => CustomContactCard(
                        icon: e.type == 0
                            ? Icons.home
                            : e.type == 1
                                ? Icons.phone
                                : Icons.email,
                        tittle: e.tittle,
                        subtittle: e.Subtittle,
                      ).fadeInRight()
                      
                      // .fadeInUp(
                      //     offset: e.type == 0
                      //         ? 0
                      //         : e.type == 1
                      //             ? 50
                      //             : 100),
                    )
                  ]);
      })).make()

      //.pSymmetric(h: 150).pSymmetric(v: 40)
    ].vStack().pSymmetric(v: 20);
  }
}
