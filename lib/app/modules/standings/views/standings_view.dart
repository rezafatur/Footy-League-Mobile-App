import 'package:flutter/material.dart';
import 'package:footy_league/app/modules/continentalAll/views/continental_all_view.dart';
import 'package:footy_league/app/modules/domesticAll/views/domestic_all_view.dart';
import 'package:footy_league/app/modules/internationalAll/views/international_all_view.dart';
import 'package:footy_league/app/modules/standings/controllers/standings_controller.dart';
import 'package:footy_league/app/modules/standings/widgets/bl1_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/bsa_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/cl_standing.dart';
import 'package:footy_league/app/modules/standings/widgets/cli_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/ded_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/ec_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/elc_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/fl1.standings.dart';
import 'package:footy_league/app/modules/standings/widgets/pd_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/pl_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/ppl_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/sa_standings.dart';
import 'package:footy_league/app/modules/standings/widgets/wc_standings.dart';
import 'package:footy_league/app/routes/app_pages.dart';
import 'package:footy_league/core/theme/colors.dart';
import 'package:footy_league/core/theme/text_theme.dart';
import 'package:footy_league/core/utils/size_configs.dart';
import 'package:get/get.dart';

class StandingsView extends GetView<StandingsController> {
  // Variable to store the league or competition code
  final String code;

  // Variable to store the source route
  final String sourceRoute;

  // Variable to store the back route
  final String backRoute;

  const StandingsView({
    Key? key,
    required this.code,
    required this.sourceRoute,
    required this.backRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    Get.put(
      // Pass the code to the constructor
      StandingsController(code),
    );

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
                      Get.to(
                        () => DomesticAllView(
                          sourceRoute: backRoute,
                        ),
                      );
                      break;
                    case Routes.CONTINENTAL_ALL:
                      Get.to(
                        () => ContinentalAllView(
                          sourceRoute: backRoute,
                        ),
                      );
                      break;
                    case Routes.INTERNATIONAL_ALL:
                      Get.to(
                        () => InternationalAllView(
                          sourceRoute: backRoute,
                        ),
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
              child: CircularProgressIndicator(
                color: greenRYB,
              ),
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
