import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../routes/app_pages.dart';
import '../controllers/domestic_all_controller.dart';

class DomesticAllView extends GetView<DomesticAllController> {
  DomesticAllView({Key? key}) : super(key: key);

  final String sourceRoute = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    Get.put(
      DomesticAllController(),
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
            "Domestic Leagues",
            style: textVerySmallBoldWhite5,
          ),
        ),
      ),

      // Section - Body
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: GridView.count(
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
            controller.contentsD.length,
            (index) {
              return InkWell(
                onTap: () {
                  Get.offNamed(
                    Routes.STANDINGS,
                    arguments: {
                      "code": controller.contentsD[index].code,
                      "sourceRoute": Routes.DOMESTIC_ALL,
                      "backRoute": sourceRoute,
                    },
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
                      controller.contentsD[index].image,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      // Background Color with Dark Jungle Green Color
      backgroundColor: darkJungleGreen,
    );
  }
}
