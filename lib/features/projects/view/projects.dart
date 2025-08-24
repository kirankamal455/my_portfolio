import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kiran_portfolio/features/projects/controller/project_details_pod.dart';
import 'package:kiran_portfolio/features/projects/view/widgets/custom_project_card.dart';
import 'package:kiran_portfolio/shared/extension/fade_extenstion.dart';
import 'package:kiran_portfolio/shared/widget/custom_project_card.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/model/user_profile_response_model.dart';
import '../../../shared/widget/custom_text_heading.dart';

class ProjectsPage extends StatefulWidget {
  final UserProfileResponseModel userProfileResponseModel;
  const ProjectsPage({super.key, required this.userProfileResponseModel});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage>  with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void launchURL(String url) async {

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {super.build(context);
  return [
      const CustomSectionHeading(headingName: "Projects").fadeInUp(),
      "Here are few samples of my previous work :)"
          .text
          .color(Colors.grey)
          .xl
          .make()
          .pOnly(top: 10).fadeInUp()
      // .fadeInUp(),
      ,
      widget.userProfileResponseModel.projects.isNotEmpty
          ? VxBox(child: Consumer(
              builder: (context, ref, child) {
                return

                    // ResponsiveBreakpoints.of(context).smallerThan(MOBILE)
                    //   ? CarouselSlider.builder(
                    //       options: CarouselOptions(
                    //         autoPlay: true,
                    //       ),
                    //       itemCount: userProfileResponseModel.projects.length,
                    //       itemBuilder: (BuildContext context, int itemIndex,
                    //               int pageViewIndex) =>
                    //           CusotmProjectCard(
                    //         projectName: userProfileResponseModel
                    //             .projects[itemIndex].projectName,
                    //         projectDescription: userProfileResponseModel
                    //             .projects[itemIndex].description,
                    //       ),
                    //     )
                    //   :
                    Wrap(
                  // alignment: WrapAlignment.center,
                  // runSpacing: 8.0,
                  // spacing: 15,
                  children: [
                    ...widget.userProfileResponseModel.projects
                        .map((project) => AeonWalletCard(
                              key: ValueKey(project.id),
                              cardId: project.id,
                              title: project.title,
                              description: project.description,
                              imageUrl: project.imageUrl,
                              techChips: project.techChips,
                              features: project.features,
                              downloads: project.downloads,
                              platform: project.platform,
                              rating: project.rating,
                              onLiveDemo: () {
                                launchURL(project.launchUrl);


                              },
                            ).w(400).fadeInRight()),
                  ],
                ).pOnly(top: 10);
              },
            )).make()
          //.pSymmetric(h: 150).pSymmetric(v: 40)
          : const Text("Projects Not Found")
    ].vStack();
  }
}
