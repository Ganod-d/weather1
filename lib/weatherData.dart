// ignore_for_file: unused_import

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/weatherModel.dart';

class WeatherData{

  Future<Weather> getData(var latitude, var longtitude ) async{
    var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=f1dc074299d849e6891151300232105&q=$latitude,$longtitude&aqi=no');
  
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);  
  }
}