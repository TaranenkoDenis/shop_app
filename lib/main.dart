import 'package:flutter/material.dart';
import 'package:shop_app/locator.dart';
import 'package:shop_app/router.dart';
import 'package:shop_app/view/screens/products_list/products_list.dart';

void main() {
  registerProjectDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
      onGenerateRoute: getRoute,
    );
  }
}
