import 'package:shop_app/common/base_bloc.dart';
import 'package:shop_app/data/models/product.dart';

class CartState extends BaseState {
  final Map<Product, int> products;

  int numberOfItemsInCart = 0;
  int totalPrice = 0;

  CartState(this.products) {
    for (final product in products.keys) {
      totalPrice += product.price * products[product];
      numberOfItemsInCart += 1 * products[product];
    }
  }

  CartState.empty() : this({});
}
