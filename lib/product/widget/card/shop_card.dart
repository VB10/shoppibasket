import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/products/model/product_model.dart';
import '../../model/user_model.dart';

class ShopCard extends StatelessWidget {
  final Product product;

  const ShopCard({Key key, @required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: IconButton(
          icon: Icon(Icons.shopping_basket),
          onPressed: () {
            context.read<User>().addFirstItemToBasket(product);
          },
        ),
        title: buildSizedBoxImage(context),
        subtitle: buildWrapSub(),
      ),
    );
  }

  Widget buildSizedBoxImage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2, child: Image.network(product.image)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          color: Colors.black12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  context.read<User>().incrementProduct(product);
                },
              ),
              Text("${context.watch<User>().basketProducts[product] ?? 0}"),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  context.read<User>().increseProduct(product);
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Wrap buildWrapSub() {
    return Wrap(
      spacing: 10,
      children: [
        Text(product.name),
        Text("${product.price}"),
      ],
    );
  }
}
