
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather{
  @JsonKey(name: 'Date')
  final String date;
  @JsonKey(name: 'Temperature')
  final Map<String, dynamic> temperature;
  @JsonKey(name: 'Day')
  final Map<String, dynamic> day;
  @JsonKey(name: 'Night')
  final Map<String, dynamic> night;

  Weather({required this.date, required this.temperature, required this.day, required this.night});

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}