import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:weather_info/city_page.dart';
import 'constants.dart';
import 'location.dart';
import 'networking.dart';

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

    setState(() {
      var temperature = weatherData["main"]["temp"];
      var firstWeather = weatherData["weather"][0];
      this.temperature = temperature.toInt();
      this.condition = firstWeather["id"];
      this.mainDesc = firstWeather["main"];
      this.icon = firstWeather["icon"];
      this.cityName = weatherData["name"];
      this.countryCode = weatherData["sys"]["country"];

      DateTime now = DateTime.now();
      DateFormat formatter = DateFormat('EEEE, MMMM d');
      this.today = formatter.format(now);
    });
  }

  void getCurrentLocationWeatherData() async {

    Location location = Location();
    await location.getCurrentLocation();
    Network network = Network(location, null);
    var weatherData = await network.getWeatherData();
    this.updateUI(weatherData);
  }

  void getCityWeatherData() async {

    Network network = Network(null, this.cityName);
    var weatherData = await network.getWeatherData();
    this.updateUI(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
            child: Padding(
              padding: EdgeInsets.only(top: 25),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "$temperature°C",
                            style: kTempTextStyle,
                          ),
                          Text(
                            mainDesc,
                            style: kConditionTextStyle,),
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
                          Text(
                            today,
                            style: kMessageTextStyle,
                          ),
                          Text(
                            "$cityName, $countryCode",
                            style: kButtonTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    child: RawMaterialButton(
                      shape: CircleBorder(),
                      fillColor: Color(0xFF101821),
                      child: Icon(Icons.add),
                      elevation: 0,
                      constraints: BoxConstraints.tightFor(
                          width: 60,
                          height: 60,
                      ),
                      onPressed: () async {
                        var cityName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                          return CityPage();
                        }));

                        if(cityName != null) {
                          this.cityName = cityName;
                          this.getCityWeatherData();
                        }
                      },
                    ),
                    bottom: 16,
                    right: 16,
                  ),
                  Positioned(
                    child: RawMaterialButton(
                      shape: CircleBorder(),
                      fillColor: Color(0xFF101821),
                      child: Icon(Icons.near_me),
                      elevation: 0,
                      constraints: BoxConstraints.tightFor(
                        width: 60,
                        height: 60,
                      ),
                      onPressed: () {
                        this.getCurrentLocationWeatherData();
                      },
                    ),
                    bottom: 16,
                    left: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
