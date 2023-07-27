import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../../../../core/utils/size_configs.dart';
import '../../../controllers/bottom_nav_controller.dart';
import '../controllers/profile_controller.dart';

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
        backgroundColor: greenRYB,
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            "Profile",
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
                SystemNavigator.pop();
              },
              icon: Image.asset(
                "assets/icons/exit_dark.png",
                height: SizeConfig.blockV! * 3,
              ),
            ),
          ),
        ],
      ),

      // Section - Body
      body: Center(
        child: Text(
          "Footy League Profile",
          style: textVerySmallBoldWhite5,
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
