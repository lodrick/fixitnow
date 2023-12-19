import 'dart:convert';

import 'package:fixitnow/api/user_api.dart';
import 'package:fixitnow/models/response.dart';
import 'package:fixitnow/models/user/user_model.dart';
import 'package:fixitnow/webservices/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserController implements UserServices {
  final String uri = UserApi.userUri;
  @override
  Future<ResponseModel?> createUser(UserModel userModel) async {
    ResponseModel? responseModel;
    try {
      final response = await http.post(Uri.parse('$uri/v1/customer'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(userModel));
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      debugPrint(json.toString());
      responseModel = ResponseModel.fromJson(json);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }

    return responseModel!;
  }

  @override
  ResponseModel deleteUser(String uId) {
    throw UnimplementedError();
  }

  @override
  ResponseModel retrieveUser(String uId) {
    throw UnimplementedError();
  }

  @override
  ResponseModel retriveUsers() {
    throw UnimplementedError();
  }

  @override
  ResponseModel updateUser(String uId) {
    throw UnimplementedError();
  }
}
