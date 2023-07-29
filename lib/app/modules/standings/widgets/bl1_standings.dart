import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';

class BL1StandingsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> standingsData;

  const BL1StandingsWidget({required this.standingsData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    // Retrieve the time and date in real time for the current year
    DateTime now = DateTime.now();
    String currentYear = DateFormat('y').format(now);

    // retrieve the time and date in real time for the next year
    DateTime nextYearDateTime = now.add(
      const Duration(days: 365),
    );
    String nextYear = DateFormat('y').format(nextYearDateTime);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          // Section - Season
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Season : $currentYear - $nextYear",
                    style: textVerySmallBoldWhite5,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Section - BL1 Image and Name
                Row(
                  children: [
                    // Section - Image
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            15,
                          ),
                          child: Image.asset(
                            "assets/images/domesticBundesliga.png",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    // Section - Name
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Bundesliga",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: textVerySmall300White,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Section - Last Winner
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Last Winner :",
                    style: textVerySmallBoldWhite5,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Section - LW Image and Name
                Row(
                  children: [
                    // Section - Image
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            15,
                          ),
                          child: Image.asset(
                            "assets/images/lastwinnerBL1.png",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),

                    // Section - Name
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "FC Bayern München",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: textVerySmall300White,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),

          // Section - Border
          SizedBox(
            width: SizeConfig.screenW,
            height: 1,
            child: Container(
              color: Colors.white,
            ),
          ),

          // Section - Standings
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: 10,
              columns: [
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "Pos",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 95,
                    child: Text(
                      "Club",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "PL",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "W",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "D",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "L",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "GD",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
                DataColumn(
                  label: SizedBox(
                    width: 35,
                    child: Text(
                      "Pts",
                      style: textVerySmallBoldWhite,
                    ),
                  ),
                ),
              ],
              rows: standingsData.map(
                (teamData) {
                  final position = teamData['position'];
                  final teamName = teamData['team']['tla'];
                  final crestUrl = teamData['team']['crest'];
                  final playedGames = teamData['playedGames'];
                  final won = teamData['won'];
                  final draw = teamData['draw'];
                  final lost = teamData['lost'];
                  final goalDifference = teamData['goalDifference'];
                  final points = teamData['points'];

                  // Check if the image format is SVG
                  final isSvg = crestUrl.endsWith('.svg');

                  Widget crestWidget;
                  if (isSvg) {
                    // Use SvgPicture to load the SVG image
                    crestWidget = SvgPicture.network(
                      crestUrl,
                      width: 24, // Adjust the width of the crest image
                    );
                  } else {
                    // Use Image.network to load other image formats (e.g., PNG, JPEG)
                    crestWidget = Image.network(
                      crestUrl,
                      width: 24, // Adjust the width of the crest image
                    );
                  }

                  return DataRow(
                    cells: [
                      DataCell(
                        Text(
                          "$position",
                          style: textVerySmall300White,
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            crestWidget,
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              teamName,
                              style: textVerySmallBoldWhite,
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Text(
                          "$playedGames",
                          style: textVerySmall300White,
                        ),
                      ),
                      DataCell(
                        Text(
                          "$won",
                          style: textVerySmall300White,
                        ),
                      ),
                      DataCell(
                        Text(
                          "$draw",
                          style: textVerySmall300White,
                        ),
                      ),
                      DataCell(
                        Text(
                          "$lost",
                          style: textVerySmall300White,
                        ),
                      ),
                      DataCell(
                        Text(
                          "$goalDifference",
                          style: textVerySmall300White,
                        ),
                      ),
                      DataCell(
                        Text(
                          "$points",
                          style: textVerySmallBoldWhite,
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),

          // Section - Border
          SizedBox(
            width: SizeConfig.screenW,
            height: 1,
            child: Container(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
