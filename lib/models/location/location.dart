import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  int? locationId;
  final double lat;
  final double lng;

  Location(
    this.locationId,
    this.lat,
    this.lng,
  ) : super();

  Location.copy({required this.lat, required this.lng}) : super();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
