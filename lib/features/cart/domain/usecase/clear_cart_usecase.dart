import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../repository/cart_repo.dart';

class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase(this.repository);

  Future<Either<Failure, void>> execute() {
    return repository.clearCart();
  }
}
