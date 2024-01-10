import 'package:fixitnow/models/location/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  int? serviceId;
  final String title;
  final String description;
  final List<String> subServices;
  final String photoUrl;
  final int fkProductId;
  final int fkUserId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Location location;

  ServiceModel(
    this.serviceId,
    this.title,
    this.description,
    this.subServices,
    this.photoUrl,
    this.fkProductId,
    this.fkUserId,
    this.location,
    this.createdAt,
    this.updatedAt,
  );

  ServiceModel.copy({
    required this.title,
    required this.description,
    required this.subServices,
    required this.photoUrl,
    required this.fkProductId,
    required this.fkUserId,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
