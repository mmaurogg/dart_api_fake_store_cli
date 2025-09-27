import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:api_fake_store/src/models/cart.dart';
import 'package:api_fake_store/src/repository/cart_repository.dart';
import 'package:api_fake_store/utils/constants.dart';
import 'package:dartz/dartz.dart';

class CartApiSource extends ApiSource implements CartRepository {
  CartApiSource(super.client);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'carts';

  @override
  Future<Either<ApiException, Cart?>>? getCart(String id) async {
    final url = '$_baseUrl/$_endpoint/$id';

    return await getApi<Map<String, dynamic>>(url).then((value) {
      return value.fold((l) => Left(l), (r) {
        if (r == null) {
          return Left(ServerException("No se encontró el carrito"));
        }

        return Right(Cart.fromJson(r));
      });
    });
  }
}
