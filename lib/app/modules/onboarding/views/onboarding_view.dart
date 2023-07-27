import 'package:flutter/material.dart';
import 'package:footy_league/core/theme/colors.dart';
import 'package:get/get.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../data/models/onboarding_data.dart';
import '../../home/views/home_view.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  // Indicator
  AnimatedContainer dotsIndicator({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: controller.currentPage == index ? greenRYB : Colors.white,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      height: 5,
      curve: Curves.easeIn,
      width: SizeConfig.blockH! * 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: darkJungleGreen,
      body: SafeArea(
        child: Column(
          children: [
            // Section - Indicator
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.contents.length,
                    (int index) => dotsIndicator(index: index),
                  ),
                ),
              ),
            ),

            // Section image, title, and description
            Expanded(
              flex: 4,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.contents.length,
                itemBuilder: (context, i) {
                  Onboarding content = controller.contents[i];
                  return Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        // Section - Image
                        Image.asset(
                          content.image,
                          height: SizeConfig.blockV! * 35,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Section - Title
                        Text(
                          content.title,
                          style: textLargeBoldWhite,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 20,
                        ),

                        // Section - Description
                        Text(
                          content.description,
                          style: textVerySmall300White,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Section skip, next, and get started button
            Expanded(
              flex: 1,
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.currentPage + 1 == controller.contents.length
                        ? // Section - Get Started button
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: ElevatedButton(
                              onPressed: () {
                                controller.completeOnboarding();
                                Get.offAll(
                                  HomeView(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: greenRYB,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 100,
                                  vertical: 20,
                                ),
                              ),
                              child: Text(
                                "Get Started",
                                style: textVerySmallBoldDarkJGreen,
                              ),
                            ),
                          )
                        : // Section - Skip and Next button
                        Padding(
                            padding: const EdgeInsets.all(30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Section - Skip button
                                TextButton(
                                  onPressed: () {
                                    controller.pageController.jumpToPage(3);
                                  },
                                  child: Text(
                                    "Skip",
                                    style: textVerySmallBoldWhite,
                                  ),
                                ),

                                // Section - Next button
                                ElevatedButton(
                                  onPressed: controller.nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: greenRYB,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 20,
                                    ),
                                  ),
                                  child: Text(
                                    "Next",
                                    style: textVerySmallBoldDarkJGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
