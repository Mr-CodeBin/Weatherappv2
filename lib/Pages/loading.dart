import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? city = "Chennai";
  String? temp;
  String? tempC;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? iconn;
  String? countt;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    tempC = instance.tempC;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    iconn = instance.iconn;
    countt = instance.count;

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "temp_value": temp,
        "tempC_value": tempC,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_pic": iconn,
        "get_country": countt,
        "city_name": city
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }

    startApp(city!);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/applogo.png",
              height: 200,
              width: 300,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather App ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              "Made By Constant",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const SpinKitSpinningLines(
              color: Colors.black,
              size: 80.0,
            )
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 242, 240, 240),
    );
  }
}
