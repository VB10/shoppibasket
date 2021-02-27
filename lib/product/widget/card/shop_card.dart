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
        trailing: buildIconButtonAdd(context),
        title: buildSizedBoxImage(context),
        subtitle: buildWrapSub(),
      ),
    );
  }

  IconButton buildIconButtonAdd(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_basket),
      onPressed: () {
        context.read<User>().addFirstItemToBasket(product);
      },
    );
  }

  Widget buildSizedBoxImage(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2, child: Image.network(product.image)),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        buildContainerItem(context)
      ],
    );
  }

  Container buildContainerItem(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIconButtonIncrement(context),
          Text("${context.watch<User>().basketProducts[product] ?? 0}"),
          buildIconButtonRemove(context),
        ],
      ),
    );
  }

  IconButton buildIconButtonIncrement(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        context.read<User>().incrementProduct(product);
      },
    );
  }

  IconButton buildIconButtonRemove(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.remove),
      onPressed: () {
        context.read<User>().increseProduct(product);
      },
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
