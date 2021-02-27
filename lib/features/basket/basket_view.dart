import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/model/user_model.dart';
import 'basket_view_model.dart';

class BasketView extends BasketViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(child: buildListViewBaskets(context)),
          _minumumButton(context),
        ],
      ),
    );
  }

  ListView buildListViewBaskets(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<User>().basketItems.length,
      itemBuilder: (context, index) {
        final product = context.watch<User>().basketItems[index];
        return Column(
          children: [
            Image.network(product.image),
            Text("${context.watch<User>().basketProducts[product]} * ${product.price}"),
          ],
        );
      },
    );
  }

  Widget _minumumButton(BuildContext context) {
    return OutlinedButton(
      child: Text("Minumum 100 TL"),
      onPressed: context.watch<User>().basketTotalMoney > 100 ? () {} : null,
    );
  }
}
