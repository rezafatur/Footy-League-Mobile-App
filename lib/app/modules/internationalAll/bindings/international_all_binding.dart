import 'package:get/get.dart';
import '../controllers/international_all_controller.dart';

class InternationalAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternationalAllController>(
      () => InternationalAllController(),
    );
  }
}
