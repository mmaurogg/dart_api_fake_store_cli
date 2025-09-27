import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:api_fake_store/src/models/product.dart';
import 'package:api_fake_store/src/repository/product_repository.dart';
import 'package:api_fake_store/utils/constants.dart';
import 'package:dartz/dartz.dart';

class ProductApiSource extends ApiSource implements ProductRepository {
  ProductApiSource(super.client);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'products';

  @override
  Future<Either<ApiException, List<Product?>>> getProducts() async {
    final url = '$_baseUrl/$_endpoint';

    return await getApi<List>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        if (r == null || r.isEmpty) {
          return Left(ServerException("No se encontraron productos"));
        }

        return Right(
          (r as List).map((json) => Product.fromJson(json)).toList(),
        );
      });
    });
  }

  @override
  Future<Either<ApiException, Product?>> getProduct(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';

    return await getApi<Map<String, dynamic>>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        if (r == null) {
          return Left(ServerException("No se encontró el producto"));
        }

        return Right(Product.fromJson(r));
      });
    });
  }
}
