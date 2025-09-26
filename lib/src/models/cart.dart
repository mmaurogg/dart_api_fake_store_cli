import 'package:api_fake_store/src/models/cart_product.dart';

class Cart {
  int? id;
  int? userId;
  DateTime? date;
  List<CartProduct>? products;

  Cart({this.id, this.userId, this.date, this.products});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    if (json['date'] != null) {
      date = DateTime.parse(json['date']);
    }
    if (json['products'] != null) {
      products = <CartProduct>[];
      json['products'].forEach((v) {
        products!.add(CartProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['date'] = date?.toIso8601String();
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
