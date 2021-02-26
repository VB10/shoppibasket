import 'dart:io';

import 'package:dio/dio.dart';

import '../../features/products/model/product_model.dart';

class UserService {
  Dio dio;

  UserService() {
    dio = Dio(BaseOptions(baseUrl: Platform.isIOS ? "http://localhost:3000" : "http://10.0.2.2:3000"));
  }

  Future<List<Product>> getAllProducts() async {
    final response = await dio.get("/products");

    if (response.statusCode == HttpStatus.ok) {
      final responseBody = response.data as List;

      return responseBody.map((e) => Product.fromJson(e)).toList();
    }

    throw Exception();
  }

  Future<bool> addProduct(Product product) async {
    final response = await dio.post("/product", data: product.toJson(), options: Options(headers: {"user-id": "5fbd48380fe34c4b213dfe6b"}));

    if (response.statusCode == HttpStatus.ok) {
      return true;
    }

    return false;
  }
}
