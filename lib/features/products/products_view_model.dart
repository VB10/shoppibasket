import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/product/service/user_service.dart';
import './products.dart';
import 'model/product_model.dart';

abstract class ProductsViewModel extends State<Products> {
  // Add your state and logic here

  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    // Provider
    products = await context.read<UserService>().getAllProducts();
    setState(() {});
  }
}
