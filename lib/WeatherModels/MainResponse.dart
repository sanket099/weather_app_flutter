import 'package:weather_app_flutter/WeatherModels/MainTemperature.dart';

class MainResponse{
  MainTemperature mainTemperature;
  String visibility;
  Wind wind;
  String id;
  String name;
  String dt;

  MainResponse(
  {this.mainTemperature, this.visibility, this.wind, this.id, this.name, this.dt});
}

class Wind {

  String speed;
  String deg;

  Wind({this.speed, this.deg}); //double


}