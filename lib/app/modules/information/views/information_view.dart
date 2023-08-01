import 'package:flutter/material.dart';
import 'package:footy_league/app/modules/information/controllers/information_controller.dart';
import 'package:footy_league/app/routes/app_pages.dart';
import 'package:footy_league/core/theme/colors.dart';
import 'package:footy_league/core/theme/text_theme.dart';
import 'package:footy_league/core/utils/size_configs.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InformationView extends GetView<InformationController> {
  // Variable to store the source route
  final String sourceRoute;

  const InformationView({
    Key? key,
    required this.sourceRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    return Scaffold(
      // Section - App Bar
      appBar: AppBar(
        backgroundColor: greenRYB,
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  switch (sourceRoute) {
                    case Routes.HOME:
                      Get.offAllNamed(Routes.HOME);
                      break;
                    case Routes.PROFILE:
                      Get.offAllNamed(Routes.PROFILE);
                      break;
                    default:
                      Get.offAllNamed(Routes.HOME);
                  }
                },
                child: Image.asset(
                  "assets/icons/back_dark.png",
                  height: SizeConfig.blockV! * 3,
                ),
              ),
            ],
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
          ),
          child: Text(
            "Information",
            style: textVerySmallBoldWhite5,
          ),
        ),
      ),

      // Section - Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Section - Image
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Image.asset(
                "assets/images/information_about.png",
              ),
            ),

            // Section - Description
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                "Footy League is a concise football league standings application. It provides users with a simple and straightforward interface to access up-to-date football league tables. Stay informed about the latest rankings, scores, and team positions across various football leagues, all in one convenient platform.",
                style: textVerySmall300White,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // Section - Made by
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                "Made by",
                style: textVerySmallBoldWhite5,
                textAlign: TextAlign.center,
              ),
            ),

            // Section - Profile
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Image.asset(
                "assets/images/information_profile.png",
              ),
            ),

            // Section - Connect with Me
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                "Connect with Me",
                style: textVerySmallBoldWhite5,
                textAlign: TextAlign.center,
              ),
            ),

            // Section - GitHub and LinkedIn button
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 30,
              ),
              child: Row(
                children: [
                  // Section - GitHub button
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        launchUrlString(
                          "https://github.com/rezafatur",
                        );
                      },
                      child: SizedBox(
                        height: 150,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                greenRYB.withOpacity(
                                  0.75,
                                ),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              30,
                            ),
                            child: Image.asset(
                              "assets/icons/github.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),

                  // Section - LinkedIn button
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        launchUrlString(
                          "https://www.linkedin.com/in/muhammad-reza-faturrahman",
                        );
                      },
                      child: SizedBox(
                        height: 150,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                greenRYB.withOpacity(
                                  0.75,
                                ),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              30,
                            ),
                            child: Image.asset(
                              "assets/icons/linkedin.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Section - Version
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                "Version 1.0.1",
                style: textVerySmall300White,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      // Background Color with Dark Jungle Green Color
      backgroundColor: darkJungleGreen,
    );
  }
}
