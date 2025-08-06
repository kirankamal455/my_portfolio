import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/const/app_urls.dart';
import 'package:kiran_portfolio/core/gen/assets.gen.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';
import 'package:kiran_portfolio/data/model/user_profile_response_model.dart';
import 'package:kiran_portfolio/features/home/view/widgets/custom_socialmedia_icon.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../const/resource.dart';

class HomePage extends StatefulWidget {
  final UserProfileResponseModel userProfileResponseModel;
  const HomePage({super.key, required this.userProfileResponseModel});

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * 0.12, vertical: 30),
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
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          WavyAnimatedText(
                            'Hi There',
                            textStyle: TextStyle(
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: FontFamily.montserrat,
                              fontWeight: FontWeight.bold,
                              fontSize: 55,
                            ),
                          ),
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
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.poppins,
                              color: context.primaryColor),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText(
                                ' Flutter Developer',
                                speed: const Duration(milliseconds: 50),
                              ),
                              TyperAnimatedText(
                                ' UI/UX Enthusiast',
                                speed: const Duration(milliseconds: 50),
                              ),
                              TyperAnimatedText(
                                ' Programmer',
                                speed: const Duration(milliseconds: 50),
                              ),
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
                          onTap: () => print("Facebook clicked"),
                        ),
                        CustomSocialIcon(
                          iconData: FontAwesomeIcons.instagram,
                          onTap: () => print("Instagram clicked"),
                        ),
                        CustomSocialIcon(
                          iconData: FontAwesomeIcons.linkedin,
                          onTap: () => print("LinkedIn clicked"),
                        ),
                        CustomSocialIcon(
                          iconData: FontAwesomeIcons.whatsapp,
                          onTap: () => print("WhatsApp clicked"),
                        ),
                        CustomSocialIcon(
                          iconData: FontAwesomeIcons.github,
                          onTap: () => print("GitHub clicked"),
                        ),
                      ],
                    ).w(400)
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
                width: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/839214266/photo/intense-portrait-of-a-man-with-beard.jpg?s=1024x1024&w=is&k=20&c=Ts9-sZrw4AumekOsYAdzCCNEGZ3GYiJnN0_pSpqiyuU="),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ))
        ],
      ),
    )
        .box
        .height(200)
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
  }
}

class CustomSocialIcon extends StatefulWidget {
  final IconData iconData;
  final VoidCallback? onTap;
  final double size;
  final Color? color; // changed to nullable
  final Color? hoverColor; // changed to nullable

  const CustomSocialIcon({
    super.key,
    required this.iconData,
    this.onTap,
    this.size = 37,
    this.color,
    this.hoverColor,
  });

  @override
  State<CustomSocialIcon> createState() => _CustomSocialIconState();
}

class _CustomSocialIconState extends State<CustomSocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final defaultColor = isDark ? Colors.white : Colors.black;
    final defaultHoverColor = isDark ? Colors.blue[300]! : Colors.blue;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: FaIcon(
          widget.iconData,
          size: widget.size,
          color: _isHovered
              ? (widget.hoverColor ?? defaultHoverColor)
              : (widget.color ?? defaultColor),
        ),
      ),
    ).pSymmetric(h: 8);
  }
}
