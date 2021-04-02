import 'package:flutter/material.dart';
import 'location.dart';
import 'networking.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    this.getLocationData();
  }

  void getLocationData() async {

    Location location = Location();
    await location.getCurrentLocation();
    Network network = Network(location);

    var weatherData = await network.getWeatherData();
    double temperature = weatherData["main"]["temp"];
    int condition = weatherData["weather"][0]["id"];
    String cityName = weatherData["name"];

    print(temperature);
    print(condition);
    print(cityName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }
}
