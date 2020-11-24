import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/product/model/user_model.dart';
import './basket_view_model.dart';

class BasketView extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<User>().basketItems.length,
              itemBuilder: (context, index) {
                final product = context.watch<User>().basketItems[index];
                return Column(
                  children: [
                    Image.network(product.image),
                    Text(
                        "${context.watch<User>().basketProducts[product]} * ${product.price}"),
                  ],
                );
              },
            ),
          ),
          RaisedButton(
            child: Text("Minumum 100 TL"),
            onPressed:
                context.watch<User>().basketTotalMoney > 100 ? () {} : null,
          )
        ],
      ),
    );
  }
}
