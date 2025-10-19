import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/shared/widget/glass_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../features/theme_segmented_btn/view/theme_segmented_btn.dart';
import 'nav_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
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
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _showTopNavigationSheet(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Menu",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
              child: GlassCard(
                width: context.screenWidth * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavButton("HOME", () => _scrollTo(widget.homePageKey)),
                    NavButton("ABOUT", () => _scrollTo(widget.aboutMePageKey)),
                    NavButton(
                        "SERVICES", () => _scrollTo(widget.servicePageKey)),
                    NavButton(
                        "PROJECTS", () => _scrollTo(widget.projectPageKey)),
                    NavButton(
                        "CONTACT", () => _scrollTo(widget.contactPageKey)),
                    const Gap(20),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // startDownload();
                      },
                      child: const Text("RESUME"),
                    ),
                    Gap(20)
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeInOut)),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                ResponsiveVisibility(
                  visible: false,
                  visibleConditions: const [
                    Condition.smallerThan(name: TABLET)
                  ],
                  child: IconButton(
                    onPressed: () {
                      _showTopNavigationSheet(context);
                    },
                    icon: Icon(Icons.menu),
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const Gap(10),
                "Portfolio"
                    .text
                    .size(28)
                    .bold
                    .color(context.isDarkMode ? Colors.white : Colors.black)
                    .make(),
                const Spacer(),
                ResponsiveVisibility(
                  visible: false,
                  visibleConditions: const [Condition.largerThan(name: TABLET)],
                  child: Row(
                    children: [
                      NavButton("HOME", () => _scrollTo(widget.homePageKey)),
                      NavButton(
                          "ABOUT", () => _scrollTo(widget.aboutMePageKey)),
                      NavButton(
                          "SERVICES", () => _scrollTo(widget.servicePageKey)),
                      NavButton(
                          "PROJECTS", () => _scrollTo(widget.projectPageKey)),
                      NavButton(
                          "CONTACT", () => _scrollTo(widget.contactPageKey)),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: widget.startDownload,
                        child: const Text("RESUME"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                const ThemeToggleButton(),
              ],
            ),
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
    Navigator.pop(context);
  }
}
