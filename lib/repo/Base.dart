import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repo/IBase.dart';

class Base implements IBase{
  @override
  List<Weather> getWeathers() {
    return [];
  }
}