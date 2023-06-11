import 'package:fixitnow/models/role_model.dart';

class UserModel {
  String uId;
  final String name;
  final String surname;
  final String about;
  final String email;
  final String photoUrl;
  final String phoneNumber;
  final bool enabled;
  Set<RoleModel> roleModels;

  //final Set<>
  UserModel(
      {required this.uId,
      required this.name,
      required this.surname,
      required this.about,
      required this.email,
      required this.photoUrl,
      required this.phoneNumber,
      required this.enabled,
      required this.roleModels});

  Set<RoleModel> get getRoleModels {
    return roleModels;
  }

  set setRoleModels(Set<RoleModel> roleModels) {
    roleModels = roleModels;
  }
}
