import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repo/IBase.dart';
import 'package:dio/dio.dart' as dio;

class Base implements IBase {
  @override
  Future<Weather> getWeather(String locationKey) async {
    final response = await dio.Dio().get(
        'http://dataservice.accuweather.com/forecasts/v1/daily/1day/$locationKey?apikey=YgICKyx4wDUZhWblusDfM9HTeIHzq6Wt');
    final result = response.data['DailyForecasts'].first;
    final weather = Weather.fromJson(result);
    return weather;
  }

  @override
  Future<List<Location>> getLocation(String value) async {
    final response = await dio.Dio().get(
        'http://dataservice.accuweather.com/locations/v1/cities/search?apikey=YgICKyx4wDUZhWblusDfM9HTeIHzq6Wt',
        queryParameters: {'q': value});
    final result = response.data as List<dynamic>;
    return List.generate(
        result.length, (index) => Location.fromJson(result[index]));
  }

  @override
  Future<Location> getLocationByGeoPosition(
      String latitude, String longitude) async {
    final response = await dio.Dio().get(
        'http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=YgICKyx4wDUZhWblusDfM9HTeIHzq6Wt',
        queryParameters: {'q': '$latitude,$longitude'});
    final result = response.data;
    return Location.fromJson(result);
  }
}
