import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/shared/widget/bacground_painter.dart';
import 'package:kiran_portfolio/shared/widget/custom_app_bar.dart';
import 'package:kiran_portfolio/shared/widget/drawer_menu.dart';
import 'package:kiran_portfolio/shared/widget/glass_card.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:selectable/selectable.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../shared/widget/gradient_ball.dart';
import '../../about_me/view/about_me.dart';
import '../../contact/view/contact.dart';
import '../../experience/view/experience_veiw.dart';
import '../../footer_section/view/footer_section.dart';
import '../../home/view/home.dart';
import '../../projects/view/projects.dart';
import '../../services/view/services.dart';
import '../../talk_with_me/view/talk_with_me_page.dart';
import '../../tools_and_tech/view/tools_and_tech.dart';
import '../controller/dashboard_controller.dart';

@RoutePage(deferredLoading: true)
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();

  // Section keys
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final serviceKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = DashboardController();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DashboardDrawer(
          homeKey: homeKey,
          aboutKey: aboutKey,
          serviceKey: serviceKey,
          projectKey: projectKey,
          onDownload: controller.savePdf,
        ),
        appBar: CustomAppBar(
          startDownload: () => controller.downloadFromFirebase(),
          homePageKey: homeKey,
          aboutMePageKey: aboutKey,
          servicePageKey: serviceKey,
          projectPageKey: projectKey,
          contactPageKey: contactKey,
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          child: Selectable(
            child: Consumer(
              builder: (context, ref, child) {
                final userProfile = controller.mockUserProfile();
                return Stack(
                  children: [
                    Positioned.fill(  // Ensures particles cover the whole screen
                      child: ParticlesFly(
                        height: 16000, // Use screen height
                        width: MediaQuery.of(context).size.width,   // Use screen width
                        connectDots: true,
                        numberOfParticles: 700,
                      ),
                    ),
                    // Positioned.fill(
                    //   child: Image.asset(
                    //     "assets/images/profile_side.jpg",
                    //     fit: BoxFit.fitHeight,
                    //   ),
                    // ),
                    //  const Positioned.fill(child: AnimatedBackground()),
                    Column(
                      children: [
                        //const Gap(80),
                        ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                            ? const Gap(10)
                            : const Gap(80),
                        HomePage(
                          key: homeKey,
                          userProfileResponseModel: userProfile,
                        ),

                        const Experience(),
                        AboutMePage(key: aboutKey),
                        const ToolsAndTech(),
                        ServicesPage(
                          key: serviceKey,
                          userProfileResponseModel: userProfile,
                        ),
                        ProjectsPage(
                          key: projectKey,
                          userProfileResponseModel: userProfile,
                        ),
                        ContactPage(
                          key: contactKey,
                          userProfileResponseModel: userProfile,
                        ),
                        const TalkWithMePage(),
                        const FooterSection(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
