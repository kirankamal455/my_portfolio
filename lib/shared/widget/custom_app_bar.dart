import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../features/theme_segmented_btn/view/theme_segmented_btn.dart';
import 'nav_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback startDownload;
  final GlobalKey homePageKey;
  final GlobalKey aboutMePageKey;
  final GlobalKey servicePageKey;
  final GlobalKey projectPageKey;
  final GlobalKey contactPageKey;

  const CustomAppBar({
    super.key,
    required this.startDownload,
    required this.homePageKey,
    required this.aboutMePageKey,
    required this.servicePageKey,
    required this.projectPageKey,
    required this.contactPageKey,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Gap(50),
            "Portfolio".text.size(28).bold.white.make(),
            const Spacer(),
            ResponsiveVisibility(
              visible: false,
              visibleConditions: const [Condition.largerThan(name: TABLET)],
              child: Row(
                children: [
                  NavButton("HOME", () => _scrollTo(homePageKey)),
                  NavButton("ABOUT", () => _scrollTo(aboutMePageKey)),
                  NavButton("SERVICES", () => _scrollTo(servicePageKey)),
                  NavButton("PROJECTS", () => _scrollTo(projectPageKey)),
                  NavButton("CONTACT", () => _scrollTo(contactPageKey)),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: startDownload,
                    child: const Text("RESUME"),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const ThemeToggleButton(),
          ],
        ),
      ),
    );
  }

  void _scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
