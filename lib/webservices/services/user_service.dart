import 'package:fixitnow/models/response.dart';
import 'package:fixitnow/models/user/user_model.dart';

abstract class UserServices {
  Future<ResponseModel?> createUser(UserModel userModel);
  ResponseModel retriveUsers();
  ResponseModel retrieveUser(String uId);
  ResponseModel updateUser(String uId);
  ResponseModel deleteUser(String uId);
}
