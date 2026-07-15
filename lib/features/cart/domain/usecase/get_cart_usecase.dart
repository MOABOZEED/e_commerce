import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../repository/cart_repo.dart';

class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<Either<Failure, List<CartEntity>>> execute() {
    return repository.getCart();
  }
}
