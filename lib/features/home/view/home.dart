import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/const/app_urls.dart';
import 'package:kiran_portfolio/core/gen/assets.gen.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';
import 'package:kiran_portfolio/data/model/user_profile_response_model.dart';
import 'package:kiran_portfolio/data/provider/data_provider.dart';
import 'package:kiran_portfolio/features/dashboard/widgets/custom_social_icon.dart';
import 'package:kiran_portfolio/features/home/view/widgets/custom_socialmedia_icon.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../const/resource.dart';
import '../../../shared/widget/glass_card.dart';

class HomePage extends StatefulWidget {
  final UserProfileResponseModel userProfileResponseModel;
  final GlobalKey projectPageKey;
  const HomePage(
      {super.key,
      required this.userProfileResponseModel,
      required this.projectPageKey});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _controller = ScrollController();
  late AnimationController animation;
  @override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this);
    _controller.addListener(() {
      animation.value =
          1 - _controller.offset / _controller.position.maxScrollExtent;
    });
  }

  Future<void> launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final mode = context.isDarkMode;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GlassCard(
        height:
            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? null : 800,
        width: context.screenWidth * 0.86,
        child: Consumer(builder: (context, ref, c) {
          final profile_data = ref.watch(profileProvider);
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.11, vertical: 30),
            child: ResponsiveRowColumn(
              columnSpacing: 60,
              rowSpacing: 60,
              layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveRowColumnItem(
                  child: FadeInLeft(
                    config: BaseAnimationConfig(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Gap(50),
                          DefaultTextStyle(
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: FontFamily.montserrat,
                              fontWeight: FontWeight.bold,
                              fontSize: 55,
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText(
                                    profile_data.profileDetails.welcomeText),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ),

                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.userProfileResponseModel.name,
                                  style: const TextStyle(
                                      fontFamily: FontFamily.montserrat,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 55),
                                ),
                                // TextSpan(
                                //   text: ' Kamal',
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.bold,
                                //     fontSize: 55,
                                //     color: context.primaryColor,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const Gap(10),
                          Row(
                            children: <Widget>[
                              const Text(
                                '''Iam a ''',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.montserrat,
                                ),
                              ),
                              const SizedBox(height: 100.0),
                              DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.poppins,
                                  color: context.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                child: AnimatedTextKit(
                                  totalRepeatCount: 100,
                                  animatedTexts: [
                                    ...profile_data.profileDetails.domain.map(
                                      (e) => TyperAnimatedText(
                                        e,
                                        speed: const Duration(milliseconds: 50),
                                      ),
                                    )
                                    // TyperAnimatedText(
                                    //   ' Flutter Developer',
                                    //   speed: const Duration(milliseconds: 50),
                                    // ),
                                    // TyperAnimatedText(
                                    //   ' UI/UX Enthusiast',
                                    //   speed: const Duration(milliseconds: 50),
                                    // ),
                                    // TyperAnimatedText(
                                    //   ' Programmer',
                                    //   speed: const Duration(milliseconds: 50),
                                    // ),
                                  ],
                                  isRepeatingAnimation: true,
                                ),
                              )
                            ],
                          ).box.make(),
                          const Gap(20),
                          Row(
                            children: [
                              CustomSocialIcon(
                                iconData: FontAwesomeIcons.facebook,
                                onTap: () => launchURL(
                                    "https://www.facebook.com/kirankamal45"),
                              ),
                              CustomSocialIcon(
                                iconData: FontAwesomeIcons.instagram,
                                onTap: () => launchURL(
                                    "https://instagram.com/kirankamal45"),
                              ),
                              CustomSocialIcon(
                                  iconData: FontAwesomeIcons.linkedin,
                                  onTap: () => launchURL(
                                      "https://www.linkedin.com/in/kiran-kamal-055132174")),
                              CustomSocialIcon(
                                iconData: FontAwesomeIcons.whatsapp,
                                onTap: () => launchURL(
                                    "https://wa.me/+918113887254"), // use full international format
                              ),
                              CustomSocialIcon(
                                iconData: FontAwesomeIcons.github,
                                onTap: () => launchURL(
                                    "https://github.com/kirankamal455"),
                              ),
                            ],
                          ).w(400),
                          Gap(30),
                          GradientButton(
                            height: 50,
                            text: "View My Work",
                            onPressed: () {
                              Scrollable.ensureVisible(
                                widget.projectPageKey.currentContext!,
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                          // GradientButton(
                          //   text: "Resume",
                          //   onPressed: () {
                          //     Scrollable.ensureVisible(
                          //       widget.projectPageKey.currentContext!,
                          //       duration: const Duration(milliseconds: 700),
                          //       curve: Curves.easeInOut,
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ), // const Spacer(),
                ResponsiveRowColumnItem(
                  child: FadeInRight(
                    config: BaseAnimationConfig(
                      child: Container(
                        height: 280,
                        width: 280, // same height & width for a perfect circle
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            alignment: Alignment
                                .topCenter, // 🔹 ensures image is centered
                            fit: BoxFit.cover, // 🔹 fills the circle properly
                            image: AssetImage(R.ASSETS_IMAGES_PROFILE_JPG),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
              .box
              // .height(200)
              // .withGradient(const LinearGradient(
              //     begin: Alignment.centerLeft,
              //     end: Alignment.centerRight,
              //     colors: [
              //       Color.fromARGB(255, 36, 5, 55),
              //       Color.fromARGB(255, 146, 14, 228),
              //       Color.fromARGB(255, 108, 23, 162),
              //       Color.fromARGB(255, 108, 23, 162)
              //     ]))
              .make();
        }),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final List<Color> gradientColors;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 200,
    this.height = 50,
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.borderRadius = 25,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: text.text
          .size(fontSize)
          .color(textColor)
          .fontWeight(fontWeight)
          .make()
          .centered(),
    )
        .withGradient(LinearGradient(colors: gradientColors))
        .withRounded(value: borderRadius)
        .width(width)
        .height(height)
        .make()
        .onTap(onPressed)
        .p(10);
  }
}
