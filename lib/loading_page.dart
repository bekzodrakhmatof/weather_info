import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    super.initState();

    this.getLocation();
  }
  void getLocation() async {

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
