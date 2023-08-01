import 'package:footy_league/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt currentIndex = 0.obs;

  void onBottomNavBarTap(int i) async {
    switch (i) {
      case 0:
        currentIndex.value = i;
        Get.offAllNamed(
          Routes.HOME,
        );
        break;
      case 1:
        currentIndex.value = i;
        Get.offAllNamed(
          Routes.SEARCHING,
        );
        break;
      case 2:
        currentIndex.value = i;
        Get.offAllNamed(
          Routes.PROFILE,
        );
        break;
      default:
        currentIndex.value = i;
        Get.offAllNamed(
          Routes.HOME,
        );
    }
  }
}
