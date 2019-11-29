import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/blocs/cart/cart_events.dart';
import 'package:shop_app/blocs/cart/cart_states.dart';
import 'package:shop_app/common/base_model.dart';
import 'package:shop_app/data/models/product.dart';
import 'package:shop_app/locator.dart';

class ProductModel extends BaseModel {
  final CartBloc _cartBloc = locator<CartBloc>();

  Stream<CartState> get cartState => _cartBloc.state;

  void addToCart(Product product) {
    _cartBloc.emitEvent(AddToCartEvent(product));
  }
}
