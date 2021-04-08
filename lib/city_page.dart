import 'package:flutter/material.dart';
import 'package:weather_info/location.dart';
import 'constants.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {

  Location location;
  String cityName;

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 16,
                          left: 16
                      ),
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        fillColor: Color(0xFF3E8A6E),
                        child: Icon(Icons.arrow_back),
                        elevation: 0,
                        constraints: BoxConstraints.tightFor(
                          width: 60,
                          height: 60,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value){
                        cityName = value;
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context, cityName);
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "GET WEATHER",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFF3E8A6E),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      width: double.infinity,
                      height: 60,
                    ),
                  )
                ],
              ),
            ),
        ),
    );
  }
}
