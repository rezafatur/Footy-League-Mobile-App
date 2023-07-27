import 'package:get/get.dart';
import '../controllers/continental_all_controller.dart';

class ContinentalAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContinentalAllController>(
      () => ContinentalAllController(),
    );
  }
}
