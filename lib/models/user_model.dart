import 'package:fixitnow/models/role_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UserModel {
  int? uid;
  final String authId;
  final String name;
  final String surname;
  final String about;
  final String email;
  final String photoUrl;
  final String phoneNumber;
  final Set<RoleModel> roleModels;

  UserModel(
    this.uid,
    this.authId,
    this.name,
    this.surname,
    this.about,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.roleModels,
  );

  UserModel.copy(
    this.authId,
    this.name,
    this.surname,
    this.about,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.roleModels,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

Set<RoleModel> setRole = {};
List<UserModel> users = [
  UserModel(
      2,
      'sdfsdfsdfsdfsdfsdf',
      'Sindile',
      'Moyan',
      'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
      'sindile@gmail.com',
      'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
      '_phoneNumber',
      setRole),
  UserModel(
      3,
      'sdfsdfsdfsdfsdfsdf',
      'Alwande',
      'Mpanze',
      '_about',
      'alwande@gmail.com',
      'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
      '_phoneNumber',
      setRole),
  UserModel(
      4,
      'sdfsdfsdfsdfsdfsdf',
      'Dave',
      'Sisty',
      '_about',
      'dave@gmail.com',
      'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
      '_phoneNumber',
      setRole),
];
