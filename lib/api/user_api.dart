import 'dart:convert';

import 'package:fixitnow/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static const userUri = 'http://10.0.0.107:9090/api';

  static Stream<List<UserModel>> retrieveUsers() async* {
    Iterable iterable = {};
    try {
      final response = await http
          .get(Uri.parse('$userUri/v1/customers'), headers: <String, String>{});

      if (response.body.isNotEmpty &&
          jsonDecode(response.body)['status'] == 200) {
        iterable = jsonDecode(response.body)['object'] as Iterable;
      }
    } on Exception catch (e) {
      debugPrint('$e');
    }

    yield iterable.isNotEmpty
        ? List<UserModel>.from(
            iterable.map((model) => UserModel.fromJson(model)))
        : List<UserModel>.empty();
  }
}
