import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/model/user_model.dart';
import '../../product/widget/card/shop_card.dart';
import 'products_view_model.dart';

class ProductsView extends ProductsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [buildActionChipTotalMoney()]),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ShopCard(product: products[index]);
        },
      ),
    );
  }

  Widget buildActionChipTotalMoney() {
    return ActionChip(
      avatar: Icon(Icons.check, color: Colors.green),
      label: Text("${context.watch<User>().basketTotalMoney} TL"),
      onPressed: () {
        // TODO: Define user press
      },
    );
  }
}
