import 'package:shop_app/blocs/cart/cart_events.dart';
import 'package:shop_app/blocs/cart/cart_states.dart';
import 'package:shop_app/common/base_bloc.dart';

class CartBloc extends BaseBloc<CartEvent, CartState> {
  CartBloc() : super(initialState: CartState.empty());

  @override
  Stream<CartState> eventHandler(CartEvent event, CartState state) async* {
    if (event is AddToCartEvent) {
      final products = state.products;
      products[event.product] =
          products[event.product] == null ? 1 : products[event.product] + 1;

      yield CartState(products);
    } else if (event is RemoveFromCartEvent) {
      final products = state.products;
      final currentNumberOfProduct = products[event.product];

      if (currentNumberOfProduct < 2) {
        products.remove(event.product);
      } else {
        products[event.product] -= 1;
      }

      yield CartState(state.products);
    } else if (event is ClearCartEvent) {
      yield CartState.empty();
    } else if (event is BuyItemsInCartEvent) {}
  }
}
