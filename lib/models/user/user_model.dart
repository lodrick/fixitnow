import 'package:fixitnow/models/role/role_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel {
  int? uid;
  final String authUid;
  final String firstName;
  final String lastName;
  String? about;
  String? email;
  final bool serviceProvider;
  final String photoUrl;
  final String phoneNumber;
  final Set<RoleModel> roles;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int status;

  UserModel(
      this.uid,
      this.authUid,
      this.firstName,
      this.lastName,
      this.about,
      this.email,
      this.serviceProvider,
      this.photoUrl,
      this.phoneNumber,
      this.roles,
      this.createdAt,
      this.updatedAt,
      this.status)
      : super();

  UserModel.copy(
      {required this.authUid,
      required this.firstName,
      required this.lastName,
      this.about,
      this.email,
      required this.serviceProvider,
      required this.photoUrl,
      required this.phoneNumber,
      required this.roles,
      required this.createdAt,
      required this.updatedAt,
      required this.status})
      : super();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
