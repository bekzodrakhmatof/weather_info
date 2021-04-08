import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_info/location_page.dart';
import 'location.dart';
import 'networking.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();
    getCurrentLocationWeatherData();
  }

  void getCurrentLocationWeatherData() async {

    Location location = Location();
    await location.getCurrentLocation();
    Network network = Network(location, null);
    var weatherData = await network.getWeatherData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationPage(weatherData);
    }));
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
        child: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 200,
          ),
        ),
      ),
    );
  }
}


