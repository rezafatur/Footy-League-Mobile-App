import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';

class ELCStandingsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> standingsData;

  const ELCStandingsWidget({required this.standingsData, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    // Extracting data into variables
    var season = standingsData[0]["season"];
    var standings = standingsData[0]["standings"];

    // Displaying the extracted data
    // print("Season: $season");
    // print("Standings: $standings");

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
                    "Season : ${season["startDate"].toString().substring(0, 4)} - ${season["endDate"].toString().substring(0, 4)}",
                    style: textVerySmallBoldWhite5,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Section - ELC Image and Name
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
                            "assets/images/domesticChampionship.png",
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
                          "Sky Bet Championship",
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
                            "assets/images/lastwinnerELC.png",
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
                          "Burnley F.C.",
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
          for (var regularStandings in standings)
            Column(
              children: [
                // Section - Table
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                            "PG",
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
                            "GF",
                            style: textVerySmallBoldWhite,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: 35,
                          child: Text(
                            "GA",
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
                    rows: [
                      for (var teamData in regularStandings["table"])
                        DataRow(
                          cells: [
                            DataCell(
                              Text(
                                teamData["position"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  if (teamData["team"]["crest"] != null)
                                    teamData["team"]["crest"]
                                            .toString()
                                            .endsWith(".svg")
                                        ? SvgPicture.network(
                                            teamData["team"]["crest"],
                                            width: 30,
                                          )
                                        : Image.network(
                                            teamData["team"]["crest"],
                                            width: 30,
                                          ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    teamData["team"]["tla"],
                                    style: textVerySmallBoldWhite,
                                  ),
                                ],
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["playedGames"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["won"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["draw"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["lost"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["goalsFor"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["goalsAgainst"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["goalDifference"].toString(),
                                style: textVerySmall300White,
                              ),
                            ),
                            DataCell(
                              Text(
                                teamData["points"].toString(),
                                style: textVerySmallBoldWhite,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
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
