import 'package:dart_either/dart_either.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/repository/cart_repo.dart';
import '../datasource/cart_local_data.dart';
import '../model/cart_product_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource cartLocalDataSource;

  CartRepositoryImpl({required this.cartLocalDataSource});

  @override
  Future<Either<Failure, List<CartEntity>>> getCart() async {
    try {
      return Right(await cartLocalDataSource.getCart());
    } on Exception {
      return const Left(DatabaseFailure("Failed to load cart"));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> addToCart(
    ProductEntity product,
  ) async {
    try {
      final cart = await cartLocalDataSource.getCart();

      final index = cart.indexWhere((item) => item.product.id == product.id);

      if (index == -1) {
        cart.add(CartModel(product: product, quantity: 1));
      } else {
        cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      }

      await cartLocalDataSource.saveCart(cart);

      return Right(cart);
    } on Exception {
      return const Left(DatabaseFailure("Failed to add product"));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> increaseQuantity(
    ProductEntity product,
  ) async {
    try {
      final cart = await cartLocalDataSource.getCart();

      final index = cart.indexWhere((item) => item.product.id == product.id);

      if (index != -1) {
        cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      }

      await cartLocalDataSource.saveCart(cart);

      return Right(cart);
    } on Exception {
      return const Left(DatabaseFailure("Failed to increase quantity"));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> decreaseQuantity(
    ProductEntity product,
  ) async {
    try {
      final cart = await cartLocalDataSource.getCart();

      final index = cart.indexWhere((item) => item.product.id == product.id);

      if (index != -1) {
        if (cart[index].quantity > 1) {
          cart[index] = cart[index].copyWith(
            quantity: cart[index].quantity - 1,
          );
        } else {
          cart.removeAt(index);
        }
      }

      await cartLocalDataSource.saveCart(cart);

      return Right(cart);
    } on Exception {
      return const Left(DatabaseFailure("Failed to decrease quantity"));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> removeFromCart(
    ProductEntity product,
  ) async {
    try {
      final cart = await cartLocalDataSource.getCart();

      cart.removeWhere((item) => item.product.id == product.id);

      await cartLocalDataSource.saveCart(cart);

      return Right(cart);
    } on Exception {
      return const Left(DatabaseFailure("Failed to remove product"));
    }
  }

  @override
  Future<Either<Failure, List<CartEntity>>> clearCart() async {
    try {
      await cartLocalDataSource.clearCart();

      return const Right([]);
    } on Exception {
      return const Left(DatabaseFailure("Failed to clear cart"));
    }
  }
}
