import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../storage/local_storage.dart';

class FavoritesProvider extends ChangeNotifier {
  final LocalStorage _storage;

  FavoritesProvider(this._storage);

  List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  Future<void> loadFavorites() async {
    _favorites = await _storage.getFavorites();

    notifyListeners();
  }

  bool isFavorite(int productId) {
    return _favorites.any((product) => product.id == productId);
  }

  Future<void> toggleFavorite(Product product) async {
    if (isFavorite(product.id)) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }

    await _storage.saveFavorites(_favorites);

    notifyListeners();
  }
}
