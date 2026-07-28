import 'package:dio/dio.dart';

import '../core/constants/api_constants.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

class ProductRepository {
  final ApiService _apiService;

  ProductRepository(this._apiService);

  Future<List<Product>> getProducts({int limit = 10}) async {
    try {
      final Response response = await _apiService.dio.get(
        ApiConstants.products,

        queryParameters: {'limit': limit},
      );

      if (response.data is List) {
        final List data = response.data;

        return data.map((json) => Product.fromJson(json)).toList();
      }

      throw Exception('Invalid response format');
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Network error occurred');
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
