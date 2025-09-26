import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/models/cart.dart';
import 'package:api_fake_store/src/repository/cart_repository.dart';
import 'package:api_fake_store/utils/constants.dart';

class CartApiSource extends ApiSource implements CartRepository {
  CartApiSource(super.client);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'carts';

  @override
  Future<Cart?> getCart(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';
    final productJson = await getApi(url);

    if (productJson == null) return null;

    return Cart.fromJson(productJson);
  }
}
