import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather.dart';

abstract class IBase{
  Future<List<Weather>> getWeathers(String locationKey);
  Future<Location> getLocation(String value);
}