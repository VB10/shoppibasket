import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppibasket/product/model/user_model.dart';
import 'package:shoppibasket/product/service/user_service.dart';

import 'features/tabs/shoppi_tab_view.dart';

void main() => runApp(MultiProvider(
      providers: [
        Provider<UserService>(create: (context) => UserService()),
        ChangeNotifierProvider(create: (context) => User(context))
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: ShoppiTabView(),
    );
  }
}
