import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/models/product.dart';
import 'package:api_fake_store/src/repository/product_repository.dart';

class ProductApiSource extends ApiSource implements ProductRepository {
  ProductApiSource(super.client);

  final String _baseUrl = 'https://fakestoreapi.com';
  final String _endpoint = 'products';
  //final String _endpoint = 'users';

  @override
  Future<List<Product?>> getProducts() async {
    final url = '$_baseUrl/$_endpoint';
    final productsJson = await getApi(url);

    return (productsJson as List).map((json) {
      return Product.fromJson(json);
    }).toList();
  }

  @override
  Future<Product?> getProduct(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';
    final productJson = await getApi(url);

    if (productJson == null) return null;

    return Product.fromJson(productJson);
  }
}
