import 'package:shop_app/common/base_bloc.dart';
import 'package:shop_app/data/models/product.dart';

class CartEvent extends BaseEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;

  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;

  RemoveFromCartEvent(this.product);
}

class BuyItemsInCartEvent extends CartEvent {}

class ClearCartEvent extends CartEvent {}
