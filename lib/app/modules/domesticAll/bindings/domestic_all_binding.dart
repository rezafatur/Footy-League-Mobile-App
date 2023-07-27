import 'package:get/get.dart';
import '../controllers/domestic_all_controller.dart';

class DomesticAllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DomesticAllController>(
      () => DomesticAllController(),
    );
  }
}
