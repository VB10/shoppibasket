import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/features/products/model/product_model.dart';
import 'package:shoppibasket/product/model/user_model.dart';
import 'package:shoppibasket/product/widget/card/shop_card.dart';
import './products_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        actions: [buildActionChipTotalMoney()],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ShopCard(
            product: Product(
                image: products[index].image,
                name: products[index].name,
                price: products[index].price),
          );
        },
      ),
    );
  }

  ActionChip buildActionChipTotalMoney() {
    return ActionChip(
      avatar: Icon(Icons.check, color: Colors.green),
      label: Text("${context.watch<User>().basketTotalMoney} TL"),
      onPressed: () {},
    );
  }
}
