import 'package:fixitnow/models/user_model.dart';

abstract class UserServices {
  String createUser(UserModel userModel);
  List<UserModel> retriveUsers();
  UserModel retrieveUser(String uId);
  updateUser(String uId);
  String deleteUser(String uId);
}
