import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: SizedBox(
                height: 250,

                child: CachedNetworkImage(
                  imageUrl: product.image,

                  fit: BoxFit.contain,

                  placeholder: (context, url) {
                    return const Center(child: CircularProgressIndicator());
                  },

                  errorWidget: (context, url, error) {
                    return const Icon(Icons.image_not_supported, size: 50);
                  },
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              product.title,

              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Text(
              product.category.toUpperCase(),

              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              '\$${product.price}',

              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),

                const SizedBox(width: 8),

                Text(product.rating.toString()),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Description',

              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,

              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
