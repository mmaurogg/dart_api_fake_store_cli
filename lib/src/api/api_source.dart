import 'package:dio/dio.dart';

class ApiSource {
  final Dio client;

  ApiSource(this.client);

  Future<T?> getApi<T>(String url) async {
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        print(jsonResponse);
        return jsonResponse;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
