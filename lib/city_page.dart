import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        hintText: "Enter city name",
                        hintStyle: TextStyle(
                          color: Colors.grey
                        )
                      ),
                    ),
                  )
                ],
              )
            )
        )
    );
  }
}
