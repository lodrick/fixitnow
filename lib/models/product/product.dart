import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductModel {
  int? pid;
  final String name;
  final String productCode;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel(
    this.pid,
    this.name,
    this.productCode,
    this.status,
    this.createdAt,
    this.updatedAt,
  );

  ProductModel.copy(
    this.name,
    this.productCode,
    this.status,
    this.createdAt,
    this.updatedAt,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
