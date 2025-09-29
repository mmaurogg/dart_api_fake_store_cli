import 'dart:io';

import 'package:api_fake_store/api_fake_store.dart' as api_fake_store;
import 'package:api_fake_store/src/api/auth_api_source.dart';
import 'package:api_fake_store/src/api/cart_api_source.dart';
import 'package:api_fake_store/src/api/product_api_source.dart';
import 'package:dio/dio.dart';

Future<void> main(List<String> arguments) async {
  if (false) {
    final username = "mor_2314";
    final password = "83r5^_";

    final client = Dio();

    final authApiSource = AuthApiSource(client);
    final product_apiSource = ProductApiSource(client);
    final cartApiSource = CartApiSource(client);

    authApiSource.login(username, password).then((value) => print(value));

    //product_apiSource.getProducts();

    //product_apiSource.getProduct('1');

    //cartApiSource.getCart('1');

    return;
  }

  run();
}

Future<void> run() async {
  stdout.writeln('-------------------------------');
  stdout.writeln('Esta es la tienda Fake Store!');
  stdout.writeln('ingrese cualquier tecla y de enter para continuar');
  stdin.readLineSync();

  stdout.writeln('-------------------------------');
  await api_fake_store.login();

  stdout.writeln('-------------------------------');
  stdout.writeln('¿Qué te gustaría hacer?');
  stdout.writeln('1. Ver los productos');
  stdout.writeln('2. Ver su carrito');
  stdout.writeln('3. Salir');
  stdout.writeln('-------------------------------');

  final option = stdin.readLineSync();
  //final option = "3";

  switch (option) {
    case '1':
      api_fake_store.productManager();
      break;
    case '2':
      api_fake_store.cartManager();
      break;
    case '3':
      break;
    default:
  }
}
