import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/bottom_nav_controller.dart';
import '../../../data/models/home_continental_data.dart';
import '../../../data/models/home_domestic_data.dart';
import '../../../data/models/home_international_data.dart';
import '../controllers/searching_controller.dart';

class SearchingView extends GetView<SearchingController> {
  SearchingView({Key? key}) : super(key: key);

  final BottomNavController bottomNavController = Get.put(
    BottomNavController(),
  );

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    return Scaffold(
      // Section - App Bar (Searching)
      appBar: AppBar(
        backgroundColor: greenRYB,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: TextField(
                onChanged: (query) => controller.filterData(
                  continentalContents,
                  domesticContents,
                  internationalContents,
                  query,
                ),
                style: textVerySmall300DarkJGreen,
                decoration: InputDecoration(
                  hintText: "Search Footy League",
                  hintStyle: textVerySmall300DarkJGreen,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // Section - Body
      body: Column(
        children: [
          // Section - Display filtered results
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: ListView(
                children: [
                  // Section - Results text
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    child: Text(
                      "Results :",
                      style: textVerySmallBoldWhite5,
                    ),
                  ),

                  // Section - Display filtered continental data
                  if (controller.filteredContinentals.isNotEmpty) ...[
                    Text(
                      "Continental",
                      style: textVerySmallBoldWhite5,
                    ),
                    for (var item in controller.filteredContinentals)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              // Section - Continental image
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
                                      item.image,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),

                              // Section - Continental name
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.name,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textVerySmall300White,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],

                  // Section - Display filtered domestic data
                  if (controller.filteredDomestics.isNotEmpty) ...[
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Domestic",
                      style: textVerySmallBoldWhite5,
                    ),
                    for (var item in controller.filteredDomestics)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              // Section - Domestic image
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
                                      item.image,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),

                              // Section - Domestic name
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.name,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textVerySmall300White,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],

                  // Section - Display filtered international data
                  if (controller.filteredInternationals.isNotEmpty) ...[
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "International",
                      style: textVerySmallBoldWhite5,
                    ),
                    for (var item in controller.filteredInternationals)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              // Section - International image
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
                                      item.image,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),

                              // Section - International name
                              Expanded(
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.name,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: textVerySmall300White,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                  const SizedBox(
                    height: 15,
                  ),

                  // Section - Display a message if no results found
                  if (controller.filteredContinentals.isEmpty &&
                      controller.filteredDomestics.isEmpty &&
                      controller.filteredInternationals.isEmpty)
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),

                          // Section - Message
                          Text(
                            "No results found.",
                            style: textVerySmallBoldWhite5,
                          ),
                          const SizedBox(
                            height: 60,
                          ),

                          // Section - Image
                          Image.asset(
                            "assets/images/search_tryagain.png",
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
                "assets/icons/search_light.png",
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
