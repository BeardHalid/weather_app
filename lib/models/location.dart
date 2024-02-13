import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  @JsonKey(name: 'Key')
  final String key;
  @JsonKey(name: 'EnglishName')
  final String locationName;

  Location({required this.key, required this.locationName});
  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}