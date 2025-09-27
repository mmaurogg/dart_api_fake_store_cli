import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<ApiException, String?>> login(String username, String password);
}
