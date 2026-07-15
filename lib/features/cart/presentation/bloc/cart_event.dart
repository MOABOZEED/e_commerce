import '../../../products/domain/entity/product_entity.dart';

abstract class CartEvent {}

// class LoadCartEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProductEntity product;

  AddToCartEvent(this.product);
}

class IncreaseQuantityEvent extends CartEvent {
  final ProductEntity product;

  IncreaseQuantityEvent(this.product);
}

class DecreaseQuantityEvent extends CartEvent {
  final ProductEntity product;

  DecreaseQuantityEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final ProductEntity product;

  RemoveFromCartEvent(this.product);
}

class ClearCartEvent extends CartEvent {}