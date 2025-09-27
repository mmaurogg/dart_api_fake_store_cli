import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:api_fake_store/src/models/cart.dart';
import 'package:dartz/dartz.dart' show Either;

abstract class CartRepository {
  Future<Either<ApiException, Cart?>>? getCart(String id);
}
