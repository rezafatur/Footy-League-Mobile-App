import 'package:get/get.dart';

import '../../../data/models/home_international_data.dart';

class InternationalAllController extends GetxController {
  final contentsInternational = <International>[];

  InternationalAllController() {
    contentsInternational.addAll(internationalContents);
  }

  List<International> get contentsI => contentsInternational;
}
