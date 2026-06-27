
import 'package:dart_either/dart_either.dart';
import 'package:ecommerce/core/errors/failures.dart';

import '../entity/product_entity.dart';

abstract class ProductRepository {

  Future<Either<Failure, List<ProductEntity>>> getProducts();

}