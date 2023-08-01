import 'package:footy_league/app/modules/standings/controllers/standings_controller.dart';
import 'package:get/get.dart';

class StandingsBinding extends Bindings {
  // Variable to store the league or competition code
  final String code;

  // Constructor to initialize the code
  StandingsBinding(this.code);

  @override
  void dependencies() {
    Get.lazyPut<StandingsController>(
      // Pass the code to the constructor
      () => StandingsController(code),
    );
  }
}
