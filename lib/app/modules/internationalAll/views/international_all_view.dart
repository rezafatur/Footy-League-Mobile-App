import 'package:flutter/material.dart';
import 'package:footy_league/app/modules/internationalAll/controllers/international_all_controller.dart';
import 'package:footy_league/app/modules/standings/views/standings_view.dart';
import 'package:footy_league/app/routes/app_pages.dart';
import 'package:footy_league/core/theme/colors.dart';
import 'package:footy_league/core/theme/text_theme.dart';
import 'package:footy_league/core/utils/size_configs.dart';
import 'package:get/get.dart';

class InternationalAllView extends GetView<InternationalAllController> {
  // Variable to store the source route
  final String sourceRoute;

  const InternationalAllView({
    Key? key,
    required this.sourceRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    Get.put(
      InternationalAllController(),
    );

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
            "International Competitions",
            style: textVerySmallBoldWhite5,
          ),
        ),
      ),

      // Section - Body
      body: ListView(
        children: [
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(
              30,
            ),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            childAspectRatio: 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              controller.contentsI.length,
              (index) {
                return InkWell(
                  onTap: () {
                    Get.to(
                      () => StandingsView(
                        code: controller.contentsI[index].code,
                        sourceRoute: Routes.INTERNATIONAL_ALL,
                        backRoute: sourceRoute,
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        30,
                      ),
                      child: Image.asset(
                        controller.contentsI[index].image,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // Background Color with Dark Jungle Green Color
      backgroundColor: darkJungleGreen,
    );
  }
}
