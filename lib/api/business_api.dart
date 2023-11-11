import 'dart:convert';

import 'package:fixitnow/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BusinessApi {
  static const businessUri = 'http://10.0.0.107/api';

  static Stream<List<ProductModel>> retrieveProducts() async* {
    Iterable iterable = {};

    try {
      final response = await http.get(Uri.parse('$businessUri/v1/products'),
          headers: <String, String>{});

      if (response.body.isNotEmpty &&
          jsonDecode(response.body)['status'] == 200) {
        iterable = jsonDecode(response.body)['object'] as Iterable;
      }
    } on Exception catch (e) {
      debugPrint('$e');
    }
    yield iterable.isNotEmpty
        ? List<ProductModel>.from(
            iterable.map((model) => ProductModel.fromJson(model)))
        : List<ProductModel>.empty();
  }
}
