import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../repository/cart_repo.dart';

class IncreaseCartQuantityUseCase {
  final CartRepository repository;

  IncreaseCartQuantityUseCase(this.repository);

  Future<Either<Failure, void>> execute(ProductEntity product) {
    return repository.increaseQuantity(product);
  }
}
