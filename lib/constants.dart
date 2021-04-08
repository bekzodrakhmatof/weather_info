import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: "Spartan MB",
  fontSize: 80,
);

const kMessageTextStyle = TextStyle(
  fontSize: 20,
);

const kButtonTextStyle = TextStyle(
  fontSize: 16,
);

const kConditionTextStyle = TextStyle(
  fontFamily: "Spartan MB",
  fontSize: 30,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter city name",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide.none,
  ),
);