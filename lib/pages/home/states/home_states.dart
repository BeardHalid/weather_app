import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/weather.dart';

final getWeathersProvider = FutureProvider<List<Weather>>((ref) async {
  return [];
});