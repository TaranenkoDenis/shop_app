import 'package:flutter/material.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/blocs/cart/cart_events.dart';
import 'package:shop_app/blocs/cart/cart_states.dart';
import 'package:shop_app/data/models/product.dart';
import 'package:shop_app/locator.dart';

class CartPage extends StatelessWidget {
  final CartBloc _cartBloc = locator<CartBloc>();

  CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Корзина'),
          actions: <Widget>[
            GestureDetector(
              onTap: () => _cartBloc.emitEvent(ClearCartEvent()),
              child: Center(
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Очистить',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: StreamBuilder<CartState>(
          stream: _cartBloc.state,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return buildListOfProducts(snapshot.data.products);
            }
            return Container();
          },
        ),
      );

  Widget buildListOfProducts(Map<Product, int> products) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) {
        final product = products.keys.toList()[i];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(product.images[0]),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    product.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip,
                  ),
                ),
                _ActionButton(
                  iconData: Icons.remove,
                  onTap: () => _cartBloc.emitEvent(
                    RemoveFromCartEvent(product),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '${products[product]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                _ActionButton(
                  iconData: Icons.add,
                  onTap: () => _cartBloc.emitEvent(AddToCartEvent(product)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    Key key,
    this.onTap,
    this.iconData,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.green,
        ),
        child: Icon(
          iconData,
          color: Colors.white,
        ),
      ),
    );
  }
}
