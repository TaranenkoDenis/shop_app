import 'package:flutter/material.dart';
import 'package:shop_app/blocs/cart/cart_states.dart';
import 'package:shop_app/router.dart';

class CartButton extends StatelessWidget {
  final Stream<CartState> cartStateStream;
  const CartButton({Key key, this.cartStateStream}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(cartRoute),
        child: StreamBuilder<CartState>(
          stream: cartStateStream,
          builder: (context, snapshot) => Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: null,
              ),
              if (snapshot.hasData && snapshot.data.products.isNotEmpty)
                Positioned(
                  child: Stack(
                    children: <Widget>[
                      Icon(
                        Icons.brightness_1,
                        size: 21.0,
                        color: Colors.green[800],
                      ),
                      Positioned(
                        top: 4.0,
                        right: 6.0,
                        child: Center(
                          child: Text(
                            '${snapshot.data.numberOfItemsInCart}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
}
