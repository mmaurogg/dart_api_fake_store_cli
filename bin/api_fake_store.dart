import 'package:api_fake_store/src/api/fake_store_api_source.dart';
import 'package:api_fake_store/src/repository/fake_store_repository.dart';
import 'package:dio/dio.dart';

Future<void> main(List<String> arguments) async {
  final client = Dio();

  FakeStoreRepository fakeStoreApiSource = FakeStoreApiSource(client);

  final products = await fakeStoreApiSource.getProducts();
  //final products = await fakeStoreApiSource.getProduct('20');
  print(products);
}
