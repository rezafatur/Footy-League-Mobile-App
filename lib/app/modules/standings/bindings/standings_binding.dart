import 'package:get/get.dart';
import '../controllers/standings_controller.dart';

class StandingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StandingsController>(
      () => StandingsController(),
    );
  }
}
