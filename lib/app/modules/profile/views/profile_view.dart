import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footy_league/app/controllers/bottom_nav_controller.dart';
import 'package:footy_league/app/modules/continentalAll/views/continental_all_view.dart';
import 'package:footy_league/app/modules/domesticAll/views/domestic_all_view.dart';
import 'package:footy_league/app/modules/information/views/information_view.dart';
import 'package:footy_league/app/modules/internationalAll/views/international_all_view.dart';
import 'package:footy_league/app/modules/profile/controllers/profile_controller.dart';
import 'package:footy_league/app/routes/app_pages.dart';
import 'package:footy_league/core/theme/colors.dart';
import 'package:footy_league/core/theme/text_theme.dart';
import 'package:footy_league/core/utils/size_configs.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  final BottomNavController bottomNavController = Get.put(
    BottomNavController(),
  );

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    return Scaffold(
      // Section - App Bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: greenRYB,
        centerTitle: true,
        title: Text(
          "Profile",
          style: textVerySmallBoldWhite5,
        ),
      ),

      // Section - Body
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Section - Footy League
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Section - Logo
                    Image.asset(
                      "assets/images/logo.png",
                      height: SizeConfig.blockV! * 20,
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    // Section - Text
                    Text(
                      "Footy League",
                      style: textSmallBoldWhite,
                    ),
                  ],
                ),
              ),

              // Section - Available
              Column(
                children: [
                  // Section - Text
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Available",
                        style: textVerySmallBoldWhite,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  // Section - Domestic, Continental, and International count
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 30,
                        ),

                        // Section - Domestic Leagues
                        GetBuilder<ProfileController>(
                          builder: (controller) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => const DomesticAllView(
                                    sourceRoute: Routes.PROFILE,
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 175,
                                height: 175,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Section - Count
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenRYB,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${controller.domesticItemCount}",
                                                style:
                                                    textVerySmallBoldDarkJGreen,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Section - Category
                                        Text(
                                          "Domestic Leagues",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),

                                        // Section - Image
                                        Image.asset(
                                          "assets/icons/next_dark.png",
                                          height: SizeConfig.blockV! * 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        // Section - Continental Competitions
                        GetBuilder<ProfileController>(
                          builder: (controller) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => const ContinentalAllView(
                                    sourceRoute: Routes.PROFILE,
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 175,
                                height: 175,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Section - Count
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenRYB,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${controller.continentalItemCount}",
                                                style:
                                                    textVerySmallBoldDarkJGreen,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Section - Category
                                        Text(
                                          "Continental Competitions",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),

                                        // Section - Image
                                        Image.asset(
                                          "assets/icons/next_dark.png",
                                          height: SizeConfig.blockV! * 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        // Section - International Competitions
                        GetBuilder<ProfileController>(
                          builder: (controller) {
                            return InkWell(
                              onTap: () {
                                Get.to(
                                  () => const InternationalAllView(
                                    sourceRoute: Routes.PROFILE,
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 175,
                                height: 175,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Section - Count
                                        SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: greenRYB,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${controller.internationalItemCount}",
                                                style:
                                                    textVerySmallBoldDarkJGreen,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Section - Category
                                        Text(
                                          "International Competitions",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),

                                        // Section - Image
                                        Image.asset(
                                          "assets/icons/next_dark.png",
                                          height: SizeConfig.blockV! * 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),

                  // Section - Menu
                  Padding(
                    padding: const EdgeInsets.all(
                      30,
                    ),
                    child: Column(
                      children: [
                        // Section - Text
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Menu",
                            style: textVerySmallBoldWhite,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),

                        // Section - Menu Items
                        Container(
                          width: SizeConfig.screenW,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(
                              15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Section - Home menu
                                InkWell(
                                  onTap: () {
                                    bottomNavController.onBottomNavBarTap(0);
                                  },
                                  child: SizedBox(
                                    width: SizeConfig.screenW,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        // Section - Home icon
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: greenRYB,
                                          ),
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: Image.asset(
                                              "assets/icons/home_dark.png",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),

                                        // Section - Home text
                                        Text(
                                          "Home",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                // Section - Search menu
                                InkWell(
                                  onTap: () {
                                    bottomNavController.onBottomNavBarTap(1);
                                  },
                                  child: SizedBox(
                                    width: SizeConfig.screenW,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        // Section - Search icon
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: greenRYB,
                                          ),
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: Image.asset(
                                              "assets/icons/search_dark.png",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),

                                        // Section - Search text
                                        Text(
                                          "Search",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                // Section - Information menu
                                InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => const InformationView(
                                        sourceRoute: Routes.PROFILE,
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: SizeConfig.screenW,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        // Section - Information icon
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: greenRYB,
                                          ),
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: Image.asset(
                                              "assets/icons/information_dark.png",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),

                                        // Section - Information text
                                        Text(
                                          "Information",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                // Section - Exit menu
                                InkWell(
                                  onTap: () {
                                    SystemNavigator.pop();
                                  },
                                  child: SizedBox(
                                    width: SizeConfig.screenW,
                                    height: 30,
                                    child: Row(
                                      children: [
                                        // Section - Exit icon
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: greenRYB,
                                          ),
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: Image.asset(
                                              "assets/icons/exit_dark.png",
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),

                                        // Section - Exit text
                                        Text(
                                          "Exit",
                                          style: textVerySmallBoldDarkJGreen,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // Background Color with Dark Jungle Green Color
      backgroundColor: darkJungleGreen,

      // Bottom Navigation Bar
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: greenRYB,
          currentIndex: bottomNavController.currentIndex.value,
          onTap: (int i) => bottomNavController.onBottomNavBarTap(i),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/home_dark.png",
                height: SizeConfig.blockV! * 3,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/search_dark.png",
                height: SizeConfig.blockV! * 3,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/profile_light.png",
                height: SizeConfig.blockV! * 3,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
