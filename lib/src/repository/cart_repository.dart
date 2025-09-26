import 'package:api_fake_store/src/models/cart.dart';

abstract class CartRepository {
  Future<Cart?> getCart(String id);
}
