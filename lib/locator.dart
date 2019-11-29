import 'package:get_it/get_it.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/data/data_sources/products_data_source.dart';
import 'package:shop_app/view/screens/product_details/product_model.dart';
import 'package:shop_app/view/screens/products_list/products_list_model.dart';

GetIt locator = GetIt.instance;

void registerProjectDependencies() {
  locator
    ..registerLazySingleton(() => ProductsDataSource())
    ..registerLazySingleton(() => CartBloc())
    ..registerFactory(() => ProductListModel())
    ..registerFactory(() => ProductModel());
}

void unregisterProjectDependencies() {
  locator
    ..unregister<CartBloc>(
      disposingFunction: (bloc) => bloc.dispose(),
    )
    ..unregister<ProductListModel>(
      disposingFunction: (model) => model.dispose(),
    );
}
