// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['uid'] as int?,
      json['authUid'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['about'] as String?,
      json['email'] as String?,
      json['photoUrl'] as String,
      json['phoneNumber'] as String,
      (json['roles'] as List<dynamic>)
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toSet(),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      json['status'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  val['authUid'] = instance.authUid;
  val['firstName'] = instance.firstName;
  val['lastName'] = instance.lastName;
  writeNotNull('about', instance.about);
  writeNotNull('email', instance.email);
  val['photoUrl'] = instance.photoUrl;
  val['phoneNumber'] = instance.phoneNumber;
  val['roles'] = instance.roles.toList();
  val['createdAt'] = instance.createdAt.toIso8601String();
  val['updatedAt'] = instance.updatedAt.toIso8601String();
  val['status'] = instance.status;
  return val;
}
