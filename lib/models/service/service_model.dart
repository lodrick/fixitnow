import 'package:fixitnow/models/product/product.dart';
import 'package:fixitnow/models/user/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_model.g.dart';

@JsonSerializable()
class ServiceModel {
  int? serviceId;
  final String title;
  final String discription;
  final String photoUrl;
  final ProductModel productModel;
  final UserModel userModel;
  final DateTime createdAt;
  final DateTime updatedAt;

  ServiceModel(
    this.serviceId,
    this.title,
    this.discription,
    this.photoUrl,
    this.productModel,
    this.userModel,
    this.createdAt,
    this.updatedAt,
  );

  ServiceModel.copy(
    this.title,
    this.discription,
    this.photoUrl,
    this.productModel,
    this.userModel,
    this.createdAt,
    this.updatedAt,
  );

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);
}
