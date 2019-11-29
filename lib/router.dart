import 'package:flutter/material.dart';
import 'package:shop_app/view/screens/cart/cart.dart';
import 'package:shop_app/view/screens/product_details/product_details.dart';
import 'package:shop_app/view/screens/products_list/products_list.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case productsListRoute:
      return buildRoute(settings, ProductListPage());
    case productRoute:
      final args = settings.arguments as List;
      final heroTag = args[0];
      final product = args[1];
      return buildRoute(
        settings,
        ProductDetailsPage(
          heroTag: heroTag,
          product: product,
        ),
      );
    case cartRoute:
      return buildRoute(settings, CartPage());
  }
}

const productsListRoute = '/productsListRoute';
const productRoute = '/productRoute';
const cartRoute = '/cartRoute';

MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) =>
    MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );
