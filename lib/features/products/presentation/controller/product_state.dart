import 'package:equatable/equatable.dart';

import '../../domain/entity/product_entity.dart';

class ProductState extends Equatable {
  final bool isLoading;

  final List<ProductEntity> allProducts;

  final String? error;

  const ProductState({
    this.isLoading = false,
    this.allProducts = const [],
    this.error,
  });

  ProductState copyWith({
    bool? isLoading,
    List<ProductEntity>? allProducts ,
    String? error,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      allProducts: allProducts ?? this.allProducts ,
      error: error,
    );
  }

  @override
  List<Object?> get props => [isLoading, allProducts, error];
}
