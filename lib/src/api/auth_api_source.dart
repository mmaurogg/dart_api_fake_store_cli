import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:api_fake_store/src/repository/auth_repository.dart';
import 'package:api_fake_store/utils/constants.dart';
import 'package:dartz/dartz.dart';

class AuthApiSource extends ApiSource implements AuthRepository {
  AuthApiSource(super.client);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'auth/login';

  @override
  Future<Either<ApiException, String?>> login(
    String username,
    String password,
  ) async {
    final url = '$_baseUrl/$_endpoint';
    final data = {'username': username, 'password': password};

    return await postApi<Map<String, dynamic>>(url, data).then((value) {
      return value.fold((l) => Left(l), (r) {
        if (r?['token'] == null) {
          return Left(ServerException("No se encontró el token"));
        }
        String? token = r!['token'];
        return Right(token);
      });
    });
  }
}
