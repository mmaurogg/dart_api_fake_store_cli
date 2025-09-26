import 'dart:io';

import 'package:api_fake_store/api_fake_store.dart' as api_fake_store;
import 'package:api_fake_store/src/api/auth_api_source.dart';
import 'package:api_fake_store/src/api/cart_api_source.dart';
import 'package:api_fake_store/src/api/product_api_source.dart';
import 'package:dio/dio.dart';

Future<void> main(List<String> arguments) async {
  // api_fake_store.main(arguments);

  final username = "mor_2314";
  final password = "83r5^_";

  final client = Dio();

  final authApiSource = AuthApiSource(client);
  final product_apiSource = ProductApiSource(client);
  final cartApiSource = CartApiSource(client);

  //authApiSource.login(username, password);

  //product_apiSource.getProducts();

  //product_apiSource.getProduct('1');

  //cartApiSource.getCart('1');

  stdout.write('-------------------------------');
  stdout.writeln('Bienvenido a la tienda Fake Store!');
  stdout.writeln('¿Qué te gustaría hacer?');
  stdout.writeln('1. Login');
  stdout.writeln('2. Ver los productos');
  stdout.writeln('3. Ver su carrito');
  stdout.write('-------------------------------');
  stdout.writeln('\n');

  final option = stdin.readLineSync();

  switch (option) {
    case '1':
      api_fake_store.login();
      break;
    case '2':
      api_fake_store.productManager();
      break;
    case '3':
      api_fake_store.cartManager();
      break;
    default:
  }
}
