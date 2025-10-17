import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/shared/widget/custom_app_bar.dart';
import 'package:kiran_portfolio/shared/widget/drawer_menu.dart';
import 'package:kiran_portfolio/shared/widget/glass_card.dart';
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
          child: Selectable(
            child: Consumer(
              builder: (context, ref, child) {
                final userProfile = controller.mockUserProfile();
                return Stack(
                  children: [
                    // Positioned.fill(
                    //   child: Image.asset(
                    //     "assets/images/profile_side.jpg",
                    //     fit: BoxFit.fitHeight,
                    //   ),
                    // ),
                    Column(
                      children: [
                        const Gap(80),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: GlassCard(
                            height: 900,
                            width: context.screenWidth * 0.86,
                            child: HomePage(
                              key: homeKey,
                              userProfileResponseModel: userProfile,
                            ),
                          ),
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

class NeonGradientBackground extends StatelessWidget {
  final Widget child;
  const NeonGradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// --- Gradient Glow Layer ---
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF0F2027),
                  Color(0xFF203A43),
                  Color(0xFF2C5364),
                ],
                radius: 1.5,
                center: Alignment.center,
              ),
            ),
          ),

          /// --- Neon Blobs (like blue/pink/orange gradients) ---
          Positioned(
            top: -100,
            left: -100,
            child: _glowCircle(const Color(0xFF00FFFF).withOpacity(0.6), 300),
          ),
          Positioned(
            bottom: -120,
            right: -80,
            child: _glowCircle(const Color(0xFFFF00FF).withOpacity(0.5), 350),
          ),
          Positioned(
            top: 150,
            right: 200,
            child: _glowCircle(const Color(0xFFFF8C00).withOpacity(0.4), 200),
          ),

          /// --- Blur overlay for smooth glass effect ---
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: Container(color: Colors.transparent),
          ),

          /// --- Child widget (e.g., your portfolio content) ---
          SafeArea(
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _glowCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
          stops: const [0.1, 1.0],
        ),
      ),
    );
  }
}
