import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:dio/dio.dart';

class ApiSource {
  final Dio client;

  ApiSource(this.client);

  Future<T?> getApi<T>(String url) async {
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        //print(jsonResponse);
        return jsonResponse;
      } else {
        //print('Request failed with status: ${response.statusCode}.');
        throw ServerException(
          'Request failed with status: ${response?.statusCode} ',
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  Future<T?> postApi<T>(String url, T data) async {
    try {
      final response = await client.post(url, data: data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = response.data;
        //print(jsonResponse);
        return jsonResponse;
      } else {
        //print('Request failed with status: ${response.statusCode}.');
        throw ServerException(
          'Request failed with status: ${response?.statusCode} ',
        );
      }
    } on DioException catch (e) {
      _handleDioException(e);
    }
  }

  Never _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      throw NetworkException(
        e.message ??
            'No se pudo conectar al servidor. Revisa tu conexión a internet.',
      );
    }

    throw ServerException(e.message ?? 'No se pudo conectar al servidor.');
  }
}
