import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _ProjectsPageState extends State<ProjectsPage> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return [
      const CustomSectionHeading(headingName: "Projects"),
      "Here are few samples of my previous work :)"
          .text
          .color(Colors.grey)
          .xl
          .make()
          .pOnly(top: 10)
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
                  runSpacing: 8.0,
                  spacing: 15,
                  children: [
                    ...widget.userProfileResponseModel.projects
                        .map((project) => AeonWalletCard(
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
                                // You can implement dynamic logic here too, if needed
                              },
                            ).w(400).fadeInUp()) ,

                    // CusotmProjectCard(
                    //       projectName: project.projectName,
                    //       projectDescription: project.description,
                    //     )),
                    //.fadeInUp(offset: 0),
                    // const CusotmProjectCard(
                    //   projectName: 'Project 2',
                    //   projectDescription: 'Project Description 2',
                    // ).fadeInUp(offset: 50),
                    // const CusotmProjectCard(
                    //   projectName: 'Project 3',
                    //   projectDescription: 'Project Description 3',
                    // ).fadeInUp(offset: 100),
                    // const CusotmProjectCard(
                    //   projectName: 'Project 4',
                    //   projectDescription: 'Project Description 4',
                    // ).fadeInUp(offset: 150),
                    // const CusotmProjectCard(
                    //   projectName: 'Project 5',
                    //   projectDescription: 'Project Description 5',
                    // ).fadeInUp(offset: 100),
                  ],
                ).pOnly(top: 10);
              },
            )).make()
          //.pSymmetric(h: 150).pSymmetric(v: 40)
          : const Text("Projects Not Found")
    ].vStack();
  }
}
