import 'package:footy_league/app/data/models/home_continental_data.dart';
import 'package:footy_league/app/data/models/home_international_data.dart';
import 'package:get/get.dart';
import '../../../data/models/home_domestic_data.dart';

class ProfileController extends GetxController {
  final List<Domestic> domesticItems = domesticContents;
  final List<Continental> continentalItems = continentalContents;
  final List<International> internationalItems = internationalContents;

  int get domesticItemCount => domesticItems.length;
  int get continentalItemCount => continentalItems.length;
  int get internationalItemCount => internationalItems.length;
}
