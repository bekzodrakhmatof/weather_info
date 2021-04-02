import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

class LocationPage extends StatefulWidget {

  LocationPage(this.weatherData);
  final weatherData;

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  int temperature;
  int condition;
  String cityName;
  String today;
  String countryCode;
  String mainDesc;
  String icon;

  @override
  void initState() {
    super.initState();

    this.updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    print(weatherData);
    double temperature = weatherData["main"]["temp"];
    var firstWeather = weatherData["weather"][0];
    this.temperature = temperature.toInt();
    this.condition = firstWeather["id"];
    this.mainDesc = firstWeather["main"];
    print(firstWeather);
    this.icon = firstWeather["icon"];
    this.cityName = weatherData["name"];
    this.countryCode = weatherData["sys"]["country"];

    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEEE, MMMM d');
    this.today = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF101821),
                  Color(0xFF3E8A6E)
                ]
            )
        ),

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(today),
                  Text("$cityName, $countryCode"),
                ],
              ),
              Container(
                child: Center(
                  child: Image.network(
                    "https://openweathermap.org/img/wn/$icon@4x.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  )
                ),
              ),
              Column(
                children: <Widget>[
                  Text(mainDesc),
                  Text("$temperature°C"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
