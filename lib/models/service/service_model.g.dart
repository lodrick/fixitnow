// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      json['serviceId'] as int?,
      json['title'] as String,
      json['description'] as String,
      (json['subServices'] as List<dynamic>).map((e) => e as String).toList(),
      json['photoUrl'] as String,
      json['fkProductId'] as int,
      json['fkUserId'] as int,
      Location.fromJson(json['location'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'title': instance.title,
      'description': instance.description,
      'subServices': instance.subServices,
      'photoUrl': instance.photoUrl,
      'fkProductId': instance.fkProductId,
      'fkUserId': instance.fkUserId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'location': instance.location,
    };
