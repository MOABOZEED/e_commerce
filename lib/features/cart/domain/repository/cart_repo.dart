import 'package:dart_either/dart_either.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../entity/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartEntity>>> getCart();

  Future<Either<Failure, void>> addToCart(ProductEntity product);

  Future<Either<Failure, void>> increaseQuantity(ProductEntity product);

  Future<Either<Failure, void>> decreaseQuantity(ProductEntity product);

  Future<Either<Failure, void>> removeFromCart(ProductEntity product);

  Future<Either<Failure, void>> clearCart();
}