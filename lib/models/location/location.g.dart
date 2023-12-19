// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['locationId'] as int?,
      (json['lat'] as num).toDouble(),
      (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'locationId': instance.locationId,
      'lat': instance.lat,
      'lng': instance.lng,
    };
