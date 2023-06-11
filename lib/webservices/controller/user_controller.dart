import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/webservices/services/user_service.dart';

class UserController implements UserServices {
  @override
  String createUser(UserModel userModel) {
    throw UnimplementedError();
  }

  @override
  String deleteUser(String uId) {
    throw UnimplementedError();
  }

  @override
  UserModel retrieveUser(String uId) {
    throw UnimplementedError();
  }

  @override
  List<UserModel> retriveUsers() {
    throw UnimplementedError();
  }

  @override
  updateUser(String uId) {
    throw UnimplementedError();
  }
}
