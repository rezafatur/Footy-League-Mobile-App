import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/size_configs.dart';
import '../controllers/home_controller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Initializing the screen width and height
    SizeConfig().init(context);

    return GetBuilder<HomeController>(
      builder: (controller) {
        return BottomNavigationBar(
          backgroundColor: greenRYB,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                -_currentIndex == 0
                    ? "assets/icons/home_light.png"
                    : "assets/icons/home_dark.png",
                height: SizeConfig.blockV! * 3.5,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _currentIndex == 1
                    ? "assets/icons/search_light.png"
                    : "assets/icons/search_dark.png",
                height: SizeConfig.blockV! * 3.5,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                _currentIndex == 2
                    ? "assets/icons/profile_light.png"
                    : "assets/icons/profile_dark.png",
                height: SizeConfig.blockV! * 3.5,
              ),
              label: "Profile",
            ),
          ],
        );
      },
    );
  }
}
