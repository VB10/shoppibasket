import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/tabs/shoppi_tab_view.dart';
import 'product/model/user_model.dart';
import 'product/service/user_service.dart';

void main() => runApp(MultiProvider(
      providers: [
        Provider<UserService>(create: (context) => UserService()),
        ChangeNotifierProvider<User>(create: (context) => User(context)),
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
