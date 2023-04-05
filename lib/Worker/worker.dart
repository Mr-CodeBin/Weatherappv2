import 'dart:convert';
import 'package:http/http.dart';

class worker {
  String? location;

  //constructor
  worker({this.location}) {
    location = this.location;
  }

  String? temp;
  String? tempC;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? iconn;
  String? count;

  //method

  Future<void> getData() async {
    try {
      // Get data
      Response respone = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=415271745cfe862bbbf6a3b577508111"));
      Map data = jsonDecode(respone.body);

      //getting temp, Humi
      Map temp_data = data['main'];
      String get_humidity = temp_data['humidity'].toString();
      double get_temp = temp_data['temp'];
      double get_temp_inC = (temp_data['temp'] - 273.15);

      //getting air speed
      Map wind = data['wind'];
      double get_air_speed = wind['speed'] / 0.2777777777777;

      //getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String get_main_des = weather_main_data['main'];
      String get_desc = weather_main_data['description'];
      String getIcon = weather_main_data['icon'].toString();

      //getting country
      Map country = data['sys'];
      String get_country = country['country'];

      // assigning values
      temp = get_temp.toString(); //F
      tempC = get_temp_inC.toString(); //C
      humidity = get_humidity; //%
      air_speed = get_air_speed.toString(); //km per Hour
      main = get_main_des;
      description = get_desc;
      iconn = getIcon;
      count = get_country;
    } catch (e) {
      temp = "NA! ";
      tempC = "NA! ";
      humidity = "NA! ";
      air_speed = "NA! ";
      main = "NA! ";
      description = "NA! ";
      iconn = "*_*";
      count = "*_*";
    }
  }
}
