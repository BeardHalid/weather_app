// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      date: json['Date'] as String,
      temperature: json['Temperature'] as Map<String, dynamic>,
      day: json['Day'] as Map<String, dynamic>,
      night: json['Night'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'Date': instance.date,
      'Temperature': instance.temperature,
      'Day': instance.day,
      'Night': instance.night,
    };
