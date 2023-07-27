import 'package:get/get.dart';
import '../../../data/models/home_continental_data.dart';
import '../../../data/models/home_domestic_data.dart';
import '../../../data/models/home_international_data.dart';

class SearchingController extends GetxController {
  // Variables to store the filtered data
  final List<Continental> filteredContinentals = [];
  final List<Domestic> filteredDomestics = [];
  final List<International> filteredInternationals = [];

  // Function to filter data based on the search query
  void filterData(
      List<Continental> continentalContents,
      List<Domestic> domesticContents,
      List<International> internationalContents,
      String query) {
    filteredContinentals.clear();
    filteredDomestics.clear();
    filteredInternationals.clear();

    if (query.isEmpty) {
      filteredContinentals.addAll(continentalContents);
      filteredDomestics.addAll(domesticContents);
      filteredInternationals.addAll(internationalContents);
    } else {
      filteredContinentals.addAll(
        continentalContents.where(
          (item) => item.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        ),
      );
      filteredDomestics.addAll(
        domesticContents.where(
          (item) => item.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        ),
      );
      filteredInternationals.addAll(
        internationalContents.where(
          (item) => item.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        ),
      );
    }
  }
}
