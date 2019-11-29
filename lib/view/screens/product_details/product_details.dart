import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shop_app/common/base_view.dart';
import 'package:shop_app/data/models/product.dart';
import 'package:shop_app/view/screens/product_details/product_model.dart';
import 'package:shop_app/view/widgets/cart_button.dart';

class ProductDetailsPage extends StatelessWidget {
  final String heroTag;
  final Product product;
  const ProductDetailsPage({
    @required this.heroTag,
    this.product,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<ProductModel>(
        builder: (ctx, model, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              model.addToCart(product);
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          appBar: AppBar(
            title: const Text('Покупай быстрее!'),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: CartButton(cartStateStream: model.cartState),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    color: Colors.white,
                    height: 300,
                    child: Hero(
                      tag: heroTag,
                      child: Swiper(
                        itemCount: product.images.length,
                        loop: true,
                        autoplay: true,
                        autoplayDelay: 5000,
                        pagination: const SwiperPagination(),
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network(
                            product.images[index],
                            fit: BoxFit.contain,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
}
