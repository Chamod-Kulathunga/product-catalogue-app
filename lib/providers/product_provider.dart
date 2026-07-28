import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository _repository;

  ProductProvider(this._repository);

  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  List<Product> get products => _filteredProducts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  int _currentLimit = 10;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Initial Load
  Future<void> fetchProducts() async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      _products = await _repository.getProducts(limit: _currentLimit);

      _filteredProducts = List.from(_products);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Pagination Load More
  Future<void> loadMoreProducts() async {
    // Prevent duplicate API calls
    if (_isLoadingMore || _products.length >= 20) {
      return;
    }

    try {
      _isLoadingMore = true;
      notifyListeners();

      _currentLimit += 10;

      final List<Product> newProducts = await _repository.getProducts(
        limit: _currentLimit,
      );

      _products = List.from(newProducts);
      _filteredProducts = List.from(_products);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }

  // Search Products
  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      _filteredProducts = List.from(_products);
    } else {
      _filteredProducts = _products.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase().trim());
      }).toList();
    }

    notifyListeners();
  }

  // Sort Products By Price
  void sortByPrice(bool ascending) {
    _filteredProducts.sort(
      (a, b) =>
          ascending ? a.price.compareTo(b.price) : b.price.compareTo(a.price),
    );

    notifyListeners();
  }

  // Filter Products By Category
  void filterByCategory(String category) {
    if (category.isEmpty) {
      _filteredProducts = List.from(_products);
    } else {
      _filteredProducts = _products.where((product) {
        return product.category == category;
      }).toList();
    }

    notifyListeners();
  }

  // Categories
  List<String> get categories {
    return _products.map((product) => product.category).toSet().toList();
  }
}
