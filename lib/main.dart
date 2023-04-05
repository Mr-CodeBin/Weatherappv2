import 'package:flutter/material.dart';
import 'package:weatherapp/Pages/home.dart';
import 'package:weatherapp/Pages/Location.dart';
import 'package:weatherapp/Pages/loading.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => Location(),
        "/loading": (context) => Loading(),
      },
    ),
  );
}
