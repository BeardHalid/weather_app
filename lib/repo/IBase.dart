import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';

abstract class IBase{
  Future<Weather> getWeather(String locationKey);
  Future<Location> getLocationByGeoPosition(String latitude, String longitude);
  Future<List<Location>> getLocation(String value);
}