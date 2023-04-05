import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Async - Functions Start But Return Some delay.
  //Future.delayed - Function start after some delay.

  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("this is init state");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    var cityname = [
      "Mumbai",
      "Delhi",
      "Punjab",
      "Indore",
      "Pune",
      "Bhopal",
      "California"
    ];
    final _random = new Random();
    int _ranNum = _random.nextInt(90) + 10;
    var city = cityname[_random.nextInt(cityname.length)];
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = (info['tempC_value']).toString();
    String air_speed = (info['air_speed_value']).toString();

    if (temp == "NA") {
      print("NA");
    } else {
      String temp = ((info['tempC_value']).toString());
      String air_speed = ((info['air_speed_value']).toString());
    }
    String iconnn = info['icon_pic'];
    String countt = info['get_country'];
    String getcity = info['city_name'];
    String getdesc = info['des_value'];
    String gethum = info['hum_value'];

    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.5,
                  0.99
                ],
                colors: [
                  Color.fromARGB(255, 146, 200, 244),
                  Color.fromARGB(255, 247, 156, 156)
                ]),
          ),
          child: Column(
            children: <Widget>[
              Container(
                //Search container
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                margin: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((searchController.text).replaceAll(" ", "") == "") {
                          print("No Search");
                        } else {
                          Navigator.pushNamed(context, "/loading",
                              arguments: {"searchText": searchController.text});
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.search_rounded,
                          // size: 20,
                        ),
                        margin: EdgeInsets.fromLTRB(4, 0, 8, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search $city",
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                height: 500,
                width: _size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  image: DecorationImage(
                    image: AssetImage(
                      "images/weather_bg1.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.wind_power,
                                  size: 140,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(3, 4),
                                      color: Colors.grey,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, bottom: 0),
                                  child: Text(
                                    // "23°C",
                                    (temp.toString()).substring(0, 5) + "°c",
                                    style: GoogleFonts.ptSans(
                                      fontSize: 42,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(bottom: 0),
                                      alignment: Alignment.bottomCenter,
                                      height: 70,
                                      width: 70,
                                      child: Image.network(
                                        "http://openweathermap.org/img/wn/$iconnn@2x.png",
                                      ),
                                    ),
                                    Text(
                                      "$getdesc",
                                      // "shattered clouds",
                                      style: GoogleFonts.ptSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "in $getcity",
                                      style: GoogleFonts.ptSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(
                                            WeatherIcons.strong_wind,
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 4),
                                            child: Text(
                                              "Wind Now ",
                                              style: GoogleFonts.ptSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            (air_speed.toString())
                                                    .substring(0, 4) +
                                                "kmph",
                                            style: GoogleFonts.ptSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            WeatherIcons.hot,
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 4),
                                            child: Text(
                                              "Humidity",
                                              style: GoogleFonts.ptSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "$gethum%",
                                            style: GoogleFonts.ptSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            WeatherIcons.raindrops,
                                            size: 30,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 8, 8, 4),
                                            child: Text(
                                              "Precipitation",
                                              style: GoogleFonts.ptSans(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            // "87%",
                                            "$_ranNum%",
                                            style: GoogleFonts.ptSans(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: _size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white.withOpacity(0.9),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1604076913837-52ab5629fba9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.teal.withOpacity(0.1),
                          alignment: Alignment.center,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Country:",
                                  style: GoogleFonts.ptSans(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "$countt",
                                  style: GoogleFonts.ptSans(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 30,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => Homepage2(),
              //         ));
              //   },
              //   child: Text(
              //     "move to next page",
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
