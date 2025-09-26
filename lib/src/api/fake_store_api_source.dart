import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/models/product.dart';
import 'package:api_fake_store/src/repository/fake_store_repository.dart';

class FakeStoreApiSource extends ApiSource implements FakeStoreRepository {
  final String _baseUrl = 'https://fakestoreapi.com';

  FakeStoreApiSource(super.client);

  @override
  Future<List<Product?>> getProducts() async {
    final url = '$_baseUrl/products';
    final productsJson = await getApi(url);

    return (productsJson as List).map((json) {
      return Product.fromJson(json);
    }).toList();
  }

  @override
  Future<Product?> getProduct(String id) async {
    final url = '$_baseUrl/products/$id';
    final productJson = await getApi(url);

    if (productJson == null) return null;

    return Product.fromJson(productJson);
  }
}
