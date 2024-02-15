// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      key: json['Key'] as String,
      locationName: json['EnglishName'] as String,
      country: json['Country'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'Key': instance.key,
      'EnglishName': instance.locationName,
      'Country': instance.country,
    };
