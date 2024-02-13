import 'dart:convert';

import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repo/IBase.dart';
import 'package:dio/dio.dart' as dio;

class Base implements IBase {
  @override
  Future<List<Weather>> getWeathers(String locationKey) async {
    return [];
  }

  @override
  Future<Location> getLocation(String value) async {
    final response = await dio.Dio().get(
        'http://dataservice.accuweather.com/locations/v1/cities/search?apiKey=YgICKyx4wDUZhWblusDfM9HTeIHzq6Wt',
        queryParameters: {
          'q': value
        });
    final result = response.data as List<dynamic>;
    return Location.fromJson(result.first);
  }
}
