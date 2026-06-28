import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/product_entity.dart';
import '../../domain/usecase/get_product_usecase.dart';

import 'product_event.dart';

import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  List<ProductEntity> allProducts = [];

  ProductBloc(this.getProductsUseCase) : super(const ProductState()) {
    on<GetProductsEvent>(_getProducts);

    on<SearchProductsEvent>(_searchProducts);
  }







  Future<void> _getProducts(
    GetProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final result = await getProductsUseCase.execute();

    result.fold(
      ifLeft: (failure) {
        print(failure.message);


        print("Loading Products...");





        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      ifRight: (products) {
        allProducts = products;
     print(products.length);
        emit(
          state.copyWith(isLoading: false, allProducts: products),
        );
      },
    );

  }



  void _searchProducts(
      SearchProductsEvent event,
      Emitter<ProductState> emit,
      ) {
    final List<ProductEntity> filtered = allProducts.where(
          (product) {
        return product.title!
            .toLowerCase()
            .contains(
          event.query.toLowerCase(),
        );
      },
    ).toList();

    emit(
      state.copyWith(
        allProducts: filtered,
        error: null,
      ),
    );
  }


}
