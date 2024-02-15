import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repo/Base.dart';

final baseProvider = Provider<Base>((ref) {
  return Base();
});

final getWeatherProvider = FutureProvider.autoDispose<Weather?>((ref) async {
  var permission = await Geolocator.checkPermission();

  if(permission == LocationPermission.denied){
    permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied){
      Future.error('Permission denied');
    }
  }else if(permission == LocationPermission.deniedForever){
    Future.error('Permission denied permanently');
  }
  final pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  final basePrv = ref.watch(baseProvider);
  final geoLocation = await basePrv.getLocationByGeoPosition(pos.latitude.toString(), pos.longitude.toString());
  final weatherInfo = await basePrv.getWeather(geoLocation.key);
  return weatherInfo;
});