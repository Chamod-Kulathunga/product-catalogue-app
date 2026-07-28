import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

class LocalStorage {
  static const String favoriteKey = 'favorite_products';

  Future<void> saveFavorites(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();

    final productJson = products
        .map(
          (product) => jsonEncode({
            'id': product.id,
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'image': product.image,
            'category': product.category,
            'rating': product.rating,
          }),
        )
        .toList();

    await prefs.setStringList(favoriteKey, productJson);
  }

  Future<List<Product>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getStringList(favoriteKey);

    if (data == null) {
      return [];
    }

    return data.map((item) {
      final json = jsonDecode(item);

      return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        category: json['category'],
        rating: json['rating'],
      );
    }).toList();
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(favoriteKey);
  }
}
