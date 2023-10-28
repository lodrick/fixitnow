// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['uid'] as int?,
      json['authId'] as String,
      json['name'] as String,
      json['surname'] as String,
      json['about'] as String,
      json['email'] as String,
      json['photoUrl'] as String,
      json['phoneNumber'] as String,
      (json['roleModels'] as List<dynamic>)
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  val['authId'] = instance.authId;
  val['name'] = instance.name;
  val['surname'] = instance.surname;
  val['about'] = instance.about;
  val['email'] = instance.email;
  val['photoUrl'] = instance.photoUrl;
  val['phoneNumber'] = instance.phoneNumber;
  val['roleModels'] = instance.roleModels.toList();
  return val;
}
