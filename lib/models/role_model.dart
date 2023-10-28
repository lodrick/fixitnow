import 'package:json_annotation/json_annotation.dart';

part 'role_model.g.dart';

@JsonSerializable()
class RoleModel {
  final int rid;
  final String name;

  RoleModel({required this.rid, required this.name});

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
