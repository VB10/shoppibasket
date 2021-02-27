import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../product/service/user_service.dart';
import 'products.dart';
import 'model/product_model.dart';

abstract class ProductsViewModel extends State<Products> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    products = await context.read<UserService>().getAllProducts();
    setState(() {});
  }
}
