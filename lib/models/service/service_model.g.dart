// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      json['serviceId'] as int?,
      json['title'] as String,
      json['discription'] as String,
      json['photoUrl'] as String,
      ProductModel.fromJson(json['productModel'] as Map<String, dynamic>),
      UserModel.fromJson(json['userModel'] as Map<String, dynamic>),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'title': instance.title,
      'discription': instance.discription,
      'photoUrl': instance.photoUrl,
      'productModel': instance.productModel,
      'userModel': instance.userModel,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
