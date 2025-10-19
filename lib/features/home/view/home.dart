import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:gap/gap.dart';
import 'package:kiran_portfolio/const/app_urls.dart';
import 'package:kiran_portfolio/core/gen/assets.gen.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';
import 'package:kiran_portfolio/data/model/user_profile_response_model.dart';
import 'package:kiran_portfolio/features/dashboard/widgets/custom_social_icon.dart';
import 'package:kiran_portfolio/features/home/view/widgets/custom_socialmedia_icon.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../const/resource.dart';
import '../../../shared/widget/glass_card.dart';

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
      padding: const EdgeInsets.all(15),
      child: GlassCard(
        height:
            ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? null : 800,
        width: context.screenWidth * 0.86,
        child: Padding(
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
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              child: AnimatedTextKit(
                                totalRepeatCount: 100,
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
                        ).w(400),
                        Gap(30),
                        VxBox(
                                child: "VIEW MY WORK"
                                    .text
                                    .bold
                                    .size(20)
                                    .make()
                                    .centered())
                            .withGradient(LinearGradient(
                                colors: [Colors.blue, Colors.purple]))
                            .withRounded(value: 25)
                            .width(200)
                            .height(50)
                            .make()
                            .p(10)
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
            .make(),
      ),
    );
  }
}
