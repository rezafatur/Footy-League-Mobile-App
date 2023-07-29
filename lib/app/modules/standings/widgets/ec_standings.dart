import 'package:flutter/material.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';

class ECStandingsWidget extends StatelessWidget {
  const ECStandingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

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
                    "Season : 2024",
                    style: textVerySmallBoldWhite5,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                // Section - EC Image and Name
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
                            "assets/images/internationalEC.png",
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
                          "UEFA European Football Championship",
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

                // Section - Last Winner Image and Name
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
                            "assets/images/lastwinnerEC.png",
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
                          "Italia",
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

          // Section - Mesage
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(
              "assets/images/compEC.png",
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
