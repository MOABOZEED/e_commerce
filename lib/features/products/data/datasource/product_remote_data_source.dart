import 'dart:convert';
import 'dart:developer';

import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants/api_constants.dart';
import 'package:ecommerce/core/errors/exeptions.dart';
import 'package:ecommerce/core/network/error_messge.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entity/product_entity.dart';
import '../model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductEntity>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio = Dio();

  ProductRemoteDataSourceImpl(Dio dio);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get(ApiConstant.baseUrl);


      print(response.data);

      final List products = response.data['products'];

      return products.map((e) => ProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
