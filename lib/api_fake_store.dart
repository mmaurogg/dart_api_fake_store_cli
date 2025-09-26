import 'dart:io';
import 'dart:async';

import 'package:api_fake_store/src/api/auth_api_source.dart';
import 'package:api_fake_store/src/api/cart_api_source.dart';
import 'package:api_fake_store/src/api/product_api_source.dart';
import 'package:api_fake_store/src/exceptions/api_exceptions.dart';
import 'package:api_fake_store/src/models/cart.dart';
import 'package:api_fake_store/utils/loading_indicator.dart';
import 'package:dio/dio.dart';

final client = Dio();

Future<void> login() async {
  final apiSource = AuthApiSource(client);

  final stopLoading = showLoadingAnimation(text: 'Ingresando a tu cuenta');
  try {
    final username = "mor_2314";
    final password = "83r5^_";

    String? token = await apiSource.login(username, password);

    if (token != null) {
      stdout.writeln('su token es: $token');
    }
  } on ApiException catch (e) {
    stdout.writeln('Error al iniciar sesión: $e');
  } finally {
    stopLoading();
  }
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
      try {
        final products = await apiSource.getProducts();
        if (products.isNotEmpty) {
          stdout.writeln('--- Lista de Productos ---');
          for (var product in products) {
            if (product != null) {
              stdout.writeln(
                'ID: ${product.id}, Título: ${product.title}, Precio: \$${product.price}',
              );
            }
          }
        } else {
          stdout.writeln('No se encontraron productos.');
        }
      } on ApiException catch (e) {
        stdout.writeln('Error al obtener los productos: $e');
      } finally {
        stopLoading();
      }
      break;
    case '2':
      stdout.write('Ingresa el ID del producto: ');
      final id = stdin.readLineSync();
      if (id != null && id.isNotEmpty) {
        final stopLoading = showLoadingAnimation(text: 'Buscando producto $id');
        try {
          final product = await apiSource.getProduct(id);
          if (product != null) {
            stdout.writeln('--- Detalles del Producto ---');
            stdout.writeln('ID: ${product.id}');
            stdout.writeln('Título: ${product.title}');
            stdout.writeln('Precio: \$${product.price}');
            stdout.writeln('Descripción: ${product.description}');
          } else {
            stdout.writeln('No se encontró ningún producto con el ID: $id');
          }
        } on ApiException catch (e) {
          stdout.writeln('Error al obtener el producto: $e');
        } finally {
          stopLoading();
        }
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
  try {
    Cart? cart = await apiSource.getCart('1');

    if (cart != null) {
      stdout.writeln('--- Detalles del Producto ---');
      stdout.writeln('ID: ${cart.id}');
      stdout.writeln('El ID del usuario es: ${cart.userId}');
      stdout.writeln(
        'El carro tiene: ${(cart.products ?? []).length} productos',
      );
    }
  } on ApiException catch (e) {
    stdout.writeln('Error al obtener el carrito: $e');
  } finally {
    stopLoading();
  }
}
