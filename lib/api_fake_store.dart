import 'dart:io';
import 'dart:async';

import 'package:api_fake_store/src/api/auth_api_source.dart';
import 'package:api_fake_store/src/api/cart_api_source.dart';
import 'package:api_fake_store/src/api/product_api_source.dart';
import 'package:api_fake_store/src/exceptions/api_exceptions.dart';

import 'package:api_fake_store/utils/loading_indicator.dart';
import 'package:dio/dio.dart';

final client = Dio();

Future<void> login() async {
  final apiSource = AuthApiSource(client);

  final stopLoading = showLoadingAnimation(text: 'Ingresando a tu cuenta');

  final username = "mor_2314";
  final password = "83r5^_";

  final response = await apiSource.login(username, password);

  stopLoading();

  response.fold(
    (failure) {
      stdout.writeln('Error al iniciar sesión: $failure');
    },
    (token) {
      stdout.writeln('Login exitoso!');
      stdout.writeln('Tu token es: $token');
    },
  );
}

Future<void> productManager() async {
  final apiSource = ProductApiSource(client);

  stdout.writeln('¿Qué te gustaría hacer?');
  stdout.writeln('1. Ver todos los productos');
  stdout.writeln('2. Ver un producto por ID');
  stdout.writeln('\n');

  final option = stdin.readLineSync();

  switch (option) {
    case '1':
      final stopLoading = showLoadingAnimation(text: 'Obteniendo productos');

      final response = await apiSource.getProducts();

      stopLoading();

      response.fold(
        (failure) {
          stdout.writeln('Error al obtener los productos: $failure');
        },
        (products) {
          stdout.writeln('--- Lista de Productos ---');

          if (products.isEmpty) {
            return stdout.writeln('No se encontraron productos.');
          }

          for (var product in products) {
            if (product != null) {
              stdout.writeln(
                'ID: ${product.id}, Título: ${product.title}, Precio: \$${product.price}',
              );
            }
          }
        },
      );

      break;
    case '2':
      stdout.write('Ingresa el ID del producto: ');
      final id = stdin.readLineSync();
      if (id != null && id.isNotEmpty) {
        final stopLoading = showLoadingAnimation(text: 'Buscando producto $id');

        final response = await apiSource.getProduct(id);

        stopLoading();

        response.fold(
          (failure) {
            stdout.writeln('Error al obtener el producto: $failure');
          },
          (product) {
            if (product == null) {
              return stdout.writeln('el producto no tiene información.');
            }
            stdout.writeln('--- Detalles del Producto ---');
            stdout.writeln('ID: ${product.id}');
            stdout.writeln('Título: ${product.title}');
            stdout.writeln('Precio: \$${product.price}');
            stdout.writeln('Descripción: ${product.description}');
          },
        );
      } else {
        stdout.writeln('ID inválido.');
      }
      break;
    default:
      stdout.writeln('Opción no válida.');
  }

  client.close();
}

Future<void> cartManager() async {
  final apiSource = CartApiSource(client);

  final stopLoading = showLoadingAnimation(text: 'Obteniendo el carrito');

  final result = await apiSource.getCart('1');

  stopLoading();

  result?.fold(
    (failure) {
      stdout.writeln('Error al obtener el carrito: $failure');
    },
    (cart) {
      if (cart != null) {
        stdout.writeln('--- Detalles del Producto ---');
        stdout.writeln('ID: ${cart.id}');
        stdout.writeln('El ID del usuario es: ${cart.userId}');
        stdout.writeln(
          'El carro tiene: ${(cart.products ?? []).length} productos',
        );
      } else {
        stdout.writeln('No se encontró ningún carrito.');
      }
    },
  );
}
