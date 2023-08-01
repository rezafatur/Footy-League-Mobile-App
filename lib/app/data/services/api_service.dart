import 'package:http/http.dart' as http;

class ApiService {
  // URL football-data.org
  final baseUrl = "https://api.football-data.org";

  // GET Standings
  Future<http.Response> getStandings(String code) async {
    try {
      // API to get the standings
      var url = "$baseUrl/v4/competitions/$code/standings";

      // HTTP GET requests to url
      var response = await http.get(
        Uri.parse(url),
        headers: {
          "X-Auth-Token": "ENTER_YOUR_API_KEY_HERE",
        },
      );

      return response;
    } catch (e) {
      print(e);
      return http.Response(
        "Error",
        500,
      );
    }
  }
}
