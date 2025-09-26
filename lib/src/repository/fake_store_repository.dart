import 'package:api_fake_store/src/models/product.dart';

abstract class FakeStoreRepository {
  Future<List<Product?>> getProducts();
  Future<Product?> getProduct(String id);
}
