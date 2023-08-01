import 'package:footy_league/app/modules/searching/controllers/searching_controller.dart';
import 'package:get/get.dart';

class SearchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchingController>(
      () => SearchingController(),
    );
  }
}
