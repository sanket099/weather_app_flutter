import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/WeatherModels/MainResponse.dart';
import 'package:weather_app_flutter/WeatherModels/MainTemperature.dart';
class CurrentWeather{
  MainResponse mainResponse;
  Future<void> getCurrent() async{

    String url = "api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid={API key}";//baseurl
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['cod'] == 200){

      var jsonTemp = jsonDecode(jsonData['main']);

        MainTemperature mainTemperature = new MainTemperature(
          humidity: jsonTemp['humidity'],
          temp: jsonTemp['temp'],
          temp_max: jsonTemp['temp_max'],
          temp_min: jsonTemp['temp_min'],
          pressure: jsonTemp['pressure']
        );
        var jsonWind = jsonDecode(jsonData['wind']);
        Wind wind = new Wind(
          speed: jsonWind['speed'],
          deg: jsonWind['deg']
        );
        MainResponse mainResponse = new MainResponse(
          mainTemperature: mainTemperature,
          name: jsonData['name'],
          id: jsonData['id'],
          dt: jsonData['dt'],
          wind: wind
        );

        mainResponse = mainResponse;
    }


  }
}
