import 'package:get/get.dart';
import '../../../data/models/home_continental_data.dart';

class ContinentalAllController extends GetxController {
  final contentsContinental = <Continental>[];

  ContinentalAllController() {
    contentsContinental.addAll(continentalContents);
  }

  List<Continental> get contentsC => contentsContinental;
}
