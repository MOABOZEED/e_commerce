import '../../../products/data/model/product_model.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.product,
    required super.quantity,
  });

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      product: entity.product,
      quantity: entity.quantity,
    );
  }

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      product: ProductModel.fromJson(
        json["product"] as Map<String, dynamic>,
      ),
      quantity: json["quantity"] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "product": ProductModel.fromEntity(product).toJson(),
      "quantity": quantity,
    };
  }

  CartModel copyWith({
    ProductEntity? product,
    int? quantity,
  }) {
    return CartModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}