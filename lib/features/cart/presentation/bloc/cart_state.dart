import 'package:equatable/equatable.dart';

import '../../../products/domain/entity/product_entity.dart';
import '../../data/model/cart_product_model.dart';


class CartState extends Equatable {
  final List<CartModel> cartProducts;
  final bool isLoading;
  final String? error;

  const CartState({
    this.cartProducts = const [],
    this.isLoading = false,
    this.error,
  });

  double get totalPrice {
    return cartProducts.fold(
      0.0,
      (sum, product) => sum + ((product.product.price ?? 0) * product.quantity),
    );
  }

  bool get isEmpty => cartProducts.isEmpty;

  CartState copyWith({
    List<CartModel>? products,
    bool? isLoading,
    String? error,
  }) {
    return CartState(
      cartProducts: products ?? this.cartProducts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [cartProducts, isLoading, error, totalPrice];
}
