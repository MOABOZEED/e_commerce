import 'package:equatable/equatable.dart';

import '../../../products/domain/entity/product_entity.dart';

class CartEntity extends Equatable {
  final ProductEntity product;
  final int quantity;

  const CartEntity({
    required this.product,
    required this.quantity,
  });

  CartEntity copyWith({
    ProductEntity? product,
    int? quantity,
  }) {
    return CartEntity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [
    product,
    quantity,
  ];
}