import 'package:flutter/material.dart';
import 'package:footy_league/app/data/models/home_explore_data.dart';
import 'package:footy_league/app/modules/internationalAll/views/international_all_view.dart';
import 'package:footy_league/app/routes/app_pages.dart';
import 'package:footy_league/core/theme/colors.dart';
import 'package:get/get.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/bottom_nav_controller.dart';
import '../../information/views/information_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final BottomNavController bottomNavController = Get.put(
    BottomNavController(),
  );

  // Indicator
  AnimatedContainer dotsIndicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color:
            controller.currentExplorerPage == index ? greenRYB : Colors.white,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      height: 10,
      curve: Curves.easeIn,
      width: controller.currentExplorerPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    return Scaffold(
      // Section - App Bar
      appBar: AppBar(
        backgroundColor: greenRYB,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            "Footy League",
            style: textVerySmallBoldWhite5,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: IconButton(
              onPressed: () {
                Get.to(
                  () => const InformationView(
                    fromProfile: false,
                  ),
                );
              },
              icon: Image.asset(
                "assets/icons/information_dark.png",
                height: SizeConfig.blockV! * 3.5,
              ),
            ),
          ),
        ],
      ),

      // Section - Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Section - Image explore
            SizedBox(
              height: SizeConfig.screenW,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.contentsE.length,
                itemBuilder: (context, i) {
                  Explore content = controller.contentsE[i];
                  return Obx(
                    () => AnimatedOpacity(
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      opacity: controller.currentExplorerPage == i ? 1.0 : 0.5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Image.asset(
                          content.image,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Section - Indicator
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.contentsE.length,
                  (int index) => dotsIndicator(index: index),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // Section - Available Domestic Leagues
            Column(
              children: [
                // Section - Title and See All button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Section - Title
                      Text(
                        "Domestic Leagues",
                        style: textVerySmallBoldWhite,
                      ),

                      // Section - See All button
                      InkWell(
                        onTap: () {
                          Get.offNamed(
                            Routes.DOMESTIC_ALL,
                            arguments: Routes.HOME,
                          );
                        },
                        child: Text(
                          "See All",
                          style: textVerySmallGreenRYB,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Section - Domestic Leagues contents
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.contentsD.length > 5
                          ? 6
                          : controller.contentsD.length,
                      itemBuilder: (context, index) {
                        if (index == 5 && controller.contentsD.length > 5) {
                          return InkWell(
                            onTap: () {
                              Get.offNamed(
                                Routes.DOMESTIC_ALL,
                                arguments: Routes.HOME,
                              );
                            },
                            child: SizedBox(
                              width: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "See All",
                                    style: textVerySmallBoldDarkJGreen,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            Get.offNamed(
                              Routes.STANDINGS,
                              arguments: {
                                "code": controller.contentsD[index].code,
                                "sourceRoute": Routes.HOME,
                                "backRoute": Routes.HOME,
                              },
                            );
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Image.asset(
                                controller.contentsD[index].image,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            // Section - Available Continental Competitions
            Column(
              children: [
                // Section - Title and See All button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Section - Title
                      Text(
                        "Continental Competitions",
                        style: textVerySmallBoldWhite,
                      ),

                      // Section - See All button
                      InkWell(
                        onTap: () {
                          Get.offNamed(
                            Routes.CONTINENTAL_ALL,
                            arguments: Routes.HOME,
                          );
                        },
                        child: Text(
                          "See All",
                          style: textVerySmallGreenRYB,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Section - Continental Competitions contents
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.contentsC.length + 1,
                      itemBuilder: (context, index) {
                        if (index == controller.contentsC.length) {
                          return InkWell(
                            onTap: () {
                              Get.offNamed(
                                Routes.CONTINENTAL_ALL,
                                arguments: Routes.HOME,
                              );
                            },
                            child: SizedBox(
                              width: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "See All",
                                    style: textVerySmallBoldDarkJGreen,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return InkWell(
                          onTap: () {
                            Get.offNamed(
                              Routes.STANDINGS,
                              arguments: {
                                "code": controller.contentsC[index].code,
                                "sourceRoute": Routes.HOME,
                                "backRoute": Routes.HOME,
                              },
                            );
                          },
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Image.asset(
                                controller.contentsC[index].image,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            // Section - Available International Competitions
            Column(
              children: [
                // Section - Title and See All button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Section - Title
                      Text(
                        "International Competitions",
                        style: textVerySmallBoldWhite,
                      ),

                      // Section - See All button
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => const InternationalAllView(
                              fromProfile: false,
                            ),
                          );
                        },
                        child: Text(
                          "See All",
                          style: textVerySmallGreenRYB,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                // Section - International Competitions contents
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.contentsI.length + 1,
                      itemBuilder: (context, index) {
                        if (index == controller.contentsI.length) {
                          return InkWell(
                            onTap: () {
                              Get.offAllNamed(
                                Routes.INTERNATIONAL_ALL,
                              );
                            },
                            child: SizedBox(
                              width: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "See All",
                                    style: textVerySmallBoldDarkJGreen,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30),
                              child: Image.asset(
                                controller.contentsI[index].image,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(
                        width: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
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
                "assets/icons/home_light.png",
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
                "assets/icons/profile_dark.png",
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
