import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/core/errors/failures.dart';

import '../entity/product_entity.dart';
import '../repository/product_repository.dart';

class GetProductsUseCase {

  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<Failure,List<ProductEntity>>> execute() async {
    return await repository.getProducts();
  }}
