import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:api_fake_store/src/models/product.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<ApiException, List<Product?>>> getProducts();
  Future<Either<ApiException, Product?>> getProduct(String id);
}
