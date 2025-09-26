import 'package:api_fake_store/src/api/api_source.dart';
import 'package:api_fake_store/src/repository/auth_repository.dart';
import 'package:api_fake_store/utils/constants.dart';

class AuthApiSource extends ApiSource implements AuthRepository {
  AuthApiSource(super.client);

  final String _baseUrl = Constants.baseUrl;
  final String _endpoint = 'auth/login';

  @override
  Future<String?> login(String username, String password) async {
    final url = '$_baseUrl/$_endpoint';
    final data = {'username': username, 'password': password};

    final Map<String, dynamic>? tokenJson =
        await postApi<Map<String, dynamic>?>(url, data).then((value) {
          return value;
        });

    if (tokenJson == null) return null;

    final token = tokenJson['token'];

    return token as String;
  }
}
