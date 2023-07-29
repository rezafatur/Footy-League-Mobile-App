import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../routes/app_pages.dart';
import '../controllers/standings_controller.dart';
import '../widgets/bl1_standings.dart';
import '../widgets/bsa_standings.dart';
import '../widgets/cl_standing.dart';
import '../widgets/cli_standings.dart';
import '../widgets/ded_standings.dart';
import '../widgets/ec_standings.dart';
import '../widgets/elc_standings.dart';
import '../widgets/fl1.standings.dart';
import '../widgets/pd_standings.dart';
import '../widgets/pl_standings.dart';
import '../widgets/ppl_standings.dart';
import '../widgets/sa_standings.dart';
import '../widgets/wc_standings.dart';

class StandingsView extends GetView<StandingsController> {
  StandingsView({Key? key}) : super(key: key);

  final String code = Get.arguments["code"];
  final String sourceRoute = Get.arguments["sourceRoute"];
  final String backRoute = Get.arguments["backRoute"];

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    // Helper function to get the appropriate standings widget based on code
    Widget getStandingsWidget(String code) {
      switch (code) {
        case "PL":
          return PLStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "PD":
          return PDStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "SA":
          return SAStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "BL1":
          return BL1StandingsWidget(
            standingsData: controller.standingsData,
          );
        case "DED":
          return DEDStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "FL1":
          return FL1StandingsWidget(
            standingsData: controller.standingsData,
          );
        case "PPL":
          return PPLStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "ELC":
          return ELCStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "BSA":
          return BSAStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "CL":
          return CLStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "CLI":
          return CLIStandingsWidget(
            standingsData: controller.standingsData,
          );
        case "WC":
          return const WCStandingsWidget();
        case "EC":
          return const ECStandingsWidget();
        default:
          return Container();
      }
    }

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
                    case Routes.SEARCHING:
                      Get.offAllNamed(Routes.SEARCHING);
                      break;
                    case Routes.DOMESTIC_ALL:
                      Get.offAllNamed(
                        Routes.DOMESTIC_ALL,
                        arguments: backRoute,
                      );
                      break;
                    case Routes.CONTINENTAL_ALL:
                      Get.offAllNamed(
                        Routes.CONTINENTAL_ALL,
                        arguments: backRoute,
                      );
                      break;
                    case Routes.INTERNATIONAL_ALL:
                      Get.offAllNamed(
                        Routes.INTERNATIONAL_ALL,
                        arguments: backRoute,
                      );
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
            "Standings",
            style: textVerySmallBoldWhite5,
          ),
        ),
      ),

      // Section - Body
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.standingsData.isEmpty) {
              return Center(
                child: code == "WC"
                    ? getStandingsWidget(code)
                    : code == "EC"
                        ? getStandingsWidget(code)
                        : Text(
                            'No standings data available.',
                            style: textVerySmallBoldWhite5,
                          ),
              );
            } else {
              return getStandingsWidget(code);
            }
          }
        },
      ),
      // Background Color with Dark Jungle Green Color
      backgroundColor: darkJungleGreen,
    );
  }
}
