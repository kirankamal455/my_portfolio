import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:kiran_portfolio/core/gen/fonts.gen.dart';
import 'package:kiran_portfolio/features/about_me/view/about_me.dart';
import 'package:kiran_portfolio/features/contact/view/contact.dart';
import 'package:kiran_portfolio/features/dashboard/controller/get_user_profile_pod.dart';
import 'package:kiran_portfolio/features/footer_section/view/footer_section.dart';
import 'package:kiran_portfolio/features/home/view/home.dart';
import 'package:kiran_portfolio/features/projects/view/projects.dart';
import 'package:kiran_portfolio/features/services/view/services.dart';
import 'package:kiran_portfolio/features/talk_with_me/view/talk_with_me_page.dart';
import 'package:kiran_portfolio/features/tools_and_tech/view/tools_and_tech.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:selectable/selectable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../data/model/user_profile_response_model.dart';
import '../../theme_segmented_btn/view/theme_segmented_btn.dart';

@RoutePage(
  deferredLoading: true,
)
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  var homePageKey = GlobalKey();
  var aboutMePageKey = GlobalKey();
  var servicePageKey = GlobalKey();
  var projectPageKey = GlobalKey();
  var contactPageKey = GlobalKey();

  downloadFileWeb(String url, String fileName) async {
    final httpsReference = FirebaseStorage.instance.refFromURL(url);

    try {
      const oneMegabyte = 1024 * 1024;
      final Uint8List? data = await httpsReference.getData(oneMegabyte);
      print("data is $data");
    } on FirebaseException catch (e) {
      print("Error: ${e.message}");
    }
  }

  void startDownload() async {
    downloadFileWeb(
        "gs://myportfolio-2b14b.appspot.com/dummy.pdf", "kiranResume");
  }

  Future<void> savePdf() async {
    try {
      var status = await Permission.storage.request();

      if (status.isGranted) {
        final ByteData bytes =
            await rootBundle.load("assets/pdf/kiranResume.pdf");
        final Uint8List buffer = bytes.buffer.asUint8List();

        final Directory? directory = await getExternalStorageDirectory();

        if (directory != null) {
          final File file = File('${directory.path}/kiranResume.pdf');
          await file.writeAsBytes(buffer);
          print('PDF saved to ${file.path}');
        }
      } else {
        print('Permission denied');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            context.isDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: context.primaryColor,
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: context.primaryColor),
                  accountName: const Text(
                    "Kiran Kamal",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: const Text(
                    "Kirankamal45@gmail.com",
                  ),
                  currentAccountPictureSize: const Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "K",
                      style: TextStyle(
                          fontSize: 30.0, color: context.primaryColor),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('HOME'),
                onTap: () {
                  Scrollable.ensureVisible(
                    homePageKey.currentContext!,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.book),
                title: const Text('ABOUT'),
                onTap: () {
                  Scrollable.ensureVisible(
                    aboutMePageKey.currentContext!,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium),
                title: const Text('SERVICES'),
                onTap: () {
                  Scrollable.ensureVisible(
                    servicePageKey.currentContext!,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_label),
                title: const Text('PROJECTS'),
                onTap: () {
                  Scrollable.ensureVisible(
                    projectPageKey.currentContext!,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('RESUME'),
                onTap: () {
                  savePdf();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: PreferredSize(
          preferredSize: const Size(300, 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ResponsiveVisibility(
                visible: false,
                visibleConditions: const [
                  Condition.equals(name: TABLET),
                  Condition.equals(name: MOBILE),
                  Condition.equals(name: 'MOBILE_SMALL')
                ],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                ),
              ),
              Spacer(),
              ThemeToggleButton(),
              // const ResponsiveVisibility(
              //   visible: false,
              //   visibleConditions: [Condition.largerThan(name: TABLET)],
              //   child: Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       "KIRAN",
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.w800,
              //         fontFamily: FontFamily.agustina,
              //       ),
              //     ),
              //   ),
              // ),
              // const Spacer(),
              // const ResponsiveVisibility(
              //   visible: false,
              //   visibleConditions: [
              //     Condition.equals(name: TABLET),
              //     Condition.equals(name: MOBILE),
              //     Condition.equals(name: 'MOBILE_SMALL')
              //   ],
              //   child: Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       "KIRAN",
              //       style: TextStyle(
              //         fontSize: 18,
              //         fontWeight: FontWeight.w800,
              //         fontFamily: FontFamily.agustina,
              //       ),
              //     ),
              //   ),
              // ),

              // ResponsiveVisibility(
              //   visible: false,
              //   visibleConditions: const [
              //     Condition.largerThan(name: TABLET),
              //   ],
              //   child: Padding(
              //     padding: const EdgeInsets.all(13),
              //     child: Row(
              //       children: [
              //         TextButton(
              //           onPressed: () {
              //             Scrollable.ensureVisible(
              //               homePageKey.currentContext!,
              //               duration: const Duration(milliseconds: 700),
              //               curve: Curves.easeInOut,
              //             );
              //           },
              //           child: const Text("HOME"),
              //         ),
              //         const Gap(14),
              //         TextButton(
              //           onPressed: () {
              //             Scrollable.ensureVisible(
              //               aboutMePageKey.currentContext!,
              //               duration: const Duration(milliseconds: 700),
              //               curve: Curves.easeInOut,
              //             );
              //           },
              //           child: const Text("ABOUT"),
              //         ),
              //         const Gap(14),
              //         TextButton(
              //           onPressed: () {
              //             Scrollable.ensureVisible(
              //               servicePageKey.currentContext!,
              //               duration: const Duration(milliseconds: 700),
              //               curve: Curves.easeInOut,
              //             );
              //           },
              //           child: const Text("SERVICES"),
              //         ),
              //         const Gap(14),
              //         TextButton(
              //           onPressed: () {
              //             Scrollable.ensureVisible(
              //               projectPageKey.currentContext!,
              //               duration: const Duration(milliseconds: 700),
              //               curve: Curves.easeInOut,
              //             );
              //           },
              //           child: const Text("PROJECTS"),
              //         ),
              //         const Gap(14),
              //         TextButton(
              //           onPressed: () {
              //             Scrollable.ensureVisible(
              //               contactPageKey.currentContext!,
              //               duration: const Duration(milliseconds: 700),
              //               curve: Curves.easeInOut,
              //             );
              //           },
              //           child: const Text("CONTACTS"),
              //         ),
              //         const Gap(14),
              //         OutlinedButton(
              //           onPressed: () {
              //             startDownload();
              //           },
              //           child: const Text("RESUME"),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ).pOnly(top: 50),
        ),
        body: SingleChildScrollView(
            controller: scrollController,
            child: Selectable(child: Consumer(
              builder: (context, ref, child) {
                final List<Project> mockProjects = [
                  Project(
                    id: 1,
                    title: "Aeon Wallet",
                    description:
                        "Secure e-wallet solution with support for QR payments, recurring billing, balance management, and strong security features.",
                    imageUrl:
                        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images/aeon.webp",
                    techChips: ["Flutter", "GetX", "Dio", "MVC"],
                    features: [
                      "Balance & QR Payments",
                      "Root Detection",
                      "Bill Splitting",
                      "Smart Notifications"
                    ],
                    downloads: "1M+ downloads",
                    platform: "Android",
                    rating: 3.8,
                  ),
                  Project(
                    id: 2,
                    title: "Taskify",
                    description:
                        "Smart task manager with real-time collaboration and Kanban boards for teams.",
                    imageUrl:
                        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images/aeon.webp",
                    techChips: ["Flutter", "Firebase", "Riverpod"],
                    features: [
                      "Team Collaboration",
                      "Realtime Sync",
                      "Deadline Reminders",
                      "Kanban View"
                    ],
                    downloads: "200K+ downloads",
                    platform: "Android & iOS",
                    rating: 4.6,
                  ),
                  Project(
                    id: 3,
                    title: "FitTrack Pro",
                    description:
                        "Track your workouts, calories, and goals. Sync with wearables and monitor progress.",
                    imageUrl:
                        "https://images.pexels.com/photos/4968633/pexels-photo-4968633.jpeg?auto=compress&cs=tinysrgb&w=800",
                    techChips: ["Flutter", "Bloc", "Firebase"],
                    features: [
                      "Workout Logging",
                      "Calorie Tracker",
                      "Google Fit Integration",
                      "Progress Charts"
                    ],
                    downloads: "300K+ downloads",
                    platform: "Android",
                    rating: 4.3,
                  ),
                  Project(
                    id: 4,
                    title: "EduMate",
                    description:
                        "An education platform offering video courses, quizzes, and certificates.",
                    imageUrl:
                        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//hxpert.webp",
                    techChips: ["Flutter", "GraphQL", "Hive"],
                    features: [
                      "Video Courses",
                      "Live Quizzes",
                      "Certificate Generator",
                      "Student Dashboard"
                    ],
                    downloads: "100K+ downloads",
                    platform: "Android & Web",
                    rating: 4.7,
                  ),
                  Project(
                    id: 5,
                    title: "NewsFlash",
                    description:
                        "Breaking news app with customizable categories, notifications, and offline reading.",
                    imageUrl:
                        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images/aeon.webp",
                    techChips: ["Flutter", "Dio", "Provider"],
                    features: [
                      "Real-time Updates",
                      "Offline Reading",
                      "Category Filtering",
                      "Push Notifications"
                    ],
                    downloads: "500K+ downloads",
                    platform: "Android & iOS",
                    rating: 4.4,
                  ),
                  Project(
                    id: 6,
                    title: "Travelly",
                    description:
                        "Plan trips, book hotels, and explore local experiences — all in one travel app.",
                    imageUrl:
                        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//hxpert.webp",
                    techChips: ["Flutter", "Supabase", "GetX"],
                    features: [
                      "Flight & Hotel Booking",
                      "Local Guides",
                      "Trip Itinerary",
                      "Offline Maps"
                    ],
                    downloads: "750K+ downloads",
                    platform: "Android",
                    rating: 4.5,
                  ),
                  Project(
                    id: 7,
                    title: "FinanceX",
                    description:
                        "Personal finance app to manage expenses, analyze spending, and set budgets.",
                    imageUrl:
                        "https://zmozkivkhopoeutpnnum.supabase.co/storage/v1/object/public/images//hxpert.webp",
                    techChips: ["Flutter", "Riverpod", "SQLite"],
                    features: [
                      "Budget Planner",
                      "Spending Categories",
                      "Visual Reports",
                      "Secure Backup"
                    ],
                    downloads: "900K+ downloads",
                    platform: "Android & iOS",
                    rating: 4.8,
                  ),
                ];

                var userProfile = UserProfileResponseModel(
                  name: "Kiran Kamal",
                  address: "1234 Elm Street, Springfield",
                  phone: "+1 555-1234",
                  email: "john.doe@example.com",
                  image: "https://example.com/images/john_doe.jpg",
                  projects: mockProjects,
                );
                // final userProfileAsync = ref.watch(getUserProfilePod(2));
                //
                // return userProfileAsync.when(
                //   data: (userProfile) {
                return Column(
                  children: [
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: GlassCardSample(
                        height: 900,
                        width: context.screenWidth * 0.9,
                        child: HomePage(
                          key: homePageKey,
                          userProfileResponseModel: userProfile,
                        ),
                      ),
                    ),
                    // GlassContainer.clearGlass( child:
                    //     HomePage(
                    //       key: homePageKey,
                    //       userProfileResponseModel: userProfile,
                    //     ),),
                    AboutMePage(
                      key: aboutMePageKey,
                    ),
                    const ToolsAndTech(),
                    ServicesPage(
                      key: servicePageKey,
                      userProfileResponseModel: userProfile,
                    ),
                    ProjectsPage(
                      key: projectPageKey,
                      userProfileResponseModel: userProfile,
                    ),
                    ContactPage(
                      key: contactPageKey,
                      userProfileResponseModel: userProfile,
                    ),
                    const TalkWithMePage(),
                    const FooterSection(),
                  ],
                );
              },
              // loading: () =>
              //     const Center(child: CircularProgressIndicator())
              //         .objectCenter(),
              // error: (error, stack) => Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text('Error: $error'),
              //       ElevatedButton(
              //         onPressed: () {
              //           ref.refresh(getUserProfilePod(1));
              //         },
              //         child: const Text('Retry'),
              //       ),
              //     ],
              //   ).objectCenter(),
              // ),
            ))),
      ),
    );
  }
}

class GlassCardSample extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;

  const GlassCardSample({
    required this.child,
    required this.height,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassContainer.frostedGlass(
      height: height,
      width: width,
      frostedOpacity: 0.02,
      blur: 3,
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.25),
          Colors.white.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.60),
        ],
        stops: [0.0, 0.45, 0.55, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.10), blurRadius: 20.0)
      ],
      borderRadius: BorderRadius.circular(25.0),
      //padding: EdgeInsets.all(16.0),

      borderColor: isDark
          ? Colors.white.withOpacity(0.3)
          : Colors.black.withOpacity(0.1),

      child: child,
    );
  }
}
