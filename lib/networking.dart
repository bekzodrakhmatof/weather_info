import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location.dart';

const apiKey = "740ab32df192d5ef976ab0c0fdfeaa10";
class Network {

  Network(this.location, this.cityName);
  final Location location;
  final String cityName;

  Future getWeatherData() async {

    Uri uri;

    if(cityName != null) {
      uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
        "lat": location.latitude.toString(),
        "lon": location.longitude.toString(),
        "appid": apiKey,
        "units": "metric",
      });
    }

    if(location != null) {
      uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", {
        "lat": location.latitude.toString(),
        "lon": location.longitude.toString(),
        "appid": apiKey,
        "units": "metric",
      });
    }

    http.Response response = await http.get(uri);
    if(response.statusCode == 200) {
      String body = response.body;
      return jsonDecode(body);
    } else {
      print(response.statusCode);
    }
  }
}