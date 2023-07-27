import 'package:get/get.dart';
import '../../../data/models/home_domestic_data.dart';

class DomesticAllController extends GetxController {
  final contentsDomestic = <Domestic>[];

  DomesticAllController() {
    contentsDomestic.addAll(domesticContents);
  }

  List<Domestic> get contentsD => contentsDomestic;
}
