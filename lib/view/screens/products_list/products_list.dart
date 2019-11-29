import 'package:flutter/material.dart';
import 'package:shop_app/common/base_view.dart';
import 'package:shop_app/data/models/product.dart';
import 'package:shop_app/router.dart';
import 'package:shop_app/view/screens/products_list/products_list_model.dart';
import 'package:shop_app/view/widgets/cart_button.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BaseView<ProductListModel>(
        onModelReady: (model) => model.loadProductList(),
        builder: (context, model, child) => Container(
          color: Colors.white,
          child: Scaffold(
              backgroundColor: Colors.green.withOpacity(0.3),
              appBar: AppBar(
                title: const Text('Все для вас'),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: CartButton(cartStateStream: model.cartState),
                    ),
                  )
                ],
              ),
              body: StreamBuilder<List<Product>>(
                stream: model.products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final products = snapshot.data;
                    return GridView.builder(
                      itemCount: products.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 8,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (_, i) {
                        final item = products[i];
                        return LayoutBuilder(builder: (context, constraints) {
                          final sizeOfImage = constraints.maxHeight * 0.6;
                          final heroTag = 'product_item_$i';
                          return GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                              productRoute,
                              arguments: [heroTag, item],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Hero(
                                      tag: heroTag,
                                      child: Image.network(
                                        item.images[0],
                                        height: sizeOfImage,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0,
                                    ),
                                    child: Text(
                                      item.title,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () => model.onTapItemToCart(item),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Text('В корзину'.toUpperCase()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Подождите немного',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const CircularProgressIndicator(),
                      ],
                    ),
                  );
                },
              )),
        ),
      );
}
