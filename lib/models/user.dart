import 'package:fixitnow/models/role_model.dart';

class UserModel {
  int? _userId;
  String _name;
  String _surname;
  String _about;
  String _email;
  String _photoUrl;
  String _phoneNumber;
  final Set<RoleModel> _roleModels;

  UserModel(
    this._userId,
    this._name,
    this._surname,
    this._about,
    this._email,
    this._photoUrl,
    this._phoneNumber,
    this._roleModels,
  );

  UserModel.copy(
    this._name,
    this._surname,
    this._about,
    this._email,
    this._photoUrl,
    this._phoneNumber,
    this._roleModels,
  );

  set setUserId(int userId) {
    _userId = userId;
  }

  int? get getUserId {
    return _userId;
  }

  set setName(String name) {
    _name = name;
  }

  String get getName {
    return _name;
  }

  set setSurname(String surname) {
    _surname = surname;
  }

  String get getSurname {
    return _surname;
  }

  set setAbout(String about) {
    _about = about;
  }

  String get getAbout {
    return _about;
  }

  set setEmail(String email) {
    _email = email;
  }

  String get getEmail {
    return _email;
  }

  set setPhotoUrl(String photoUrl) {
    _photoUrl = photoUrl;
  }

  String get getPhotoUrl {
    return _photoUrl;
  }

  set setPhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
  }

  String get getPhoneNumber {
    return _phoneNumber;
  }

  Set<RoleModel> get getRoleModels {
    return _roleModels;
  }

  set setRoleModels(Set<RoleModel> roleModels) {
    roleModels = roleModels;
  }
}
