import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../product/model/user_model.dart';
import '../basket/basket.dart';
import '../products/products.dart';

class ShoppiTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: buildBottomAppBar(context),
          body: TabBarView(children: [
            Products(),
            Basket(),
          ]),
        ));
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
        elevation: 20,
        child: TabBar(
          labelPadding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(
              icon: Stack(
                children: [
                  Icon(Icons.shopping_basket),
                  Positioned(top: 0, right: 0, height: 10, width: 10, child: buildCircleAvatarCounter(context)),
                ],
              ),
            )
          ],
          labelColor: Colors.black,
        ));
  }

  CircleAvatar buildCircleAvatarCounter(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      child: Text(context.watch<User>().totalProduct.toString(), style: Theme.of(context).textTheme.overline.copyWith(color: Colors.white)),
    );
  }
}
