import 'dart:convert';
import 'package:get/get.dart';
import '../../../data/services/api_service.dart';

class StandingsController extends GetxController {
  // ApiService instance
  final ApiService apiService = ApiService();

  // Standings data
  RxList<Map<String, dynamic>> standingsData = <Map<String, dynamic>>[].obs;

  // Load active data
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    String code = Get.arguments["code"];
    fetchStandingsData(code);
  }

  // Function to fetch the standings data
  Future<void> fetchStandingsData(String code) async {
    try {
      // Load active data
      isLoading.value = true;

      // Request to API Service
      var response = await apiService.getStandings(code);

      // Displays the response results on the console
      print(response.body);

      if (response.statusCode == 200) {
        // Parse JSON data into data variables
        var data = json.decode(response.body);
        standingsData.value = [data];
      }
      // Loading data is complete
      isLoading.value = false;
    } catch (e) {
      print(e);

      // Loading data is complete
      isLoading.value = false;
    }
  }
}
