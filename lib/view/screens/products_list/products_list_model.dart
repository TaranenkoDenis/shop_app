import 'package:rxdart/subjects.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/blocs/cart/cart_events.dart';
import 'package:shop_app/blocs/cart/cart_states.dart';
import 'package:shop_app/common/base_model.dart';
import 'package:shop_app/data/data_sources/products_data_source.dart';
import 'package:shop_app/data/models/product.dart';
import 'package:shop_app/locator.dart';

class ProductListModel extends BaseModel {
  final CartBloc _cartBloc = locator<CartBloc>();
  final ProductsDataSource _productsDataSource = locator<ProductsDataSource>();
  final BehaviorSubject<List<Product>> _streamCntrlProducts = BehaviorSubject();

  Stream<List<Product>> get products => _streamCntrlProducts.stream;
  Stream<CartState> get cartState => _cartBloc.state;

  void dispose() {
    _streamCntrlProducts.close();
  }

  void loadProductList() async {
    final products = await _productsDataSource.loadAllProducts();
    _streamCntrlProducts.sink.add(products);
  }

  void onTapItemToCart(Product item) {
    _cartBloc.emitEvent(AddToCartEvent(item));
  }
}
