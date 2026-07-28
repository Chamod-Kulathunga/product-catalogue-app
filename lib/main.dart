import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'providers/favorites_provider.dart';
import 'providers/product_provider.dart';
import 'providers/theme_provider.dart';
import 'repositories/product_repository.dart';
import 'screens/home/home_screen.dart';
import 'services/api_service.dart';
import 'storage/local_storage.dart';

void main() {
  runApp(const ProductCatalogueApp());
}

class ProductCatalogueApp extends StatelessWidget {
  const ProductCatalogueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(ProductRepository(ApiService())),
        ),

        ChangeNotifierProvider(
          create: (_) => FavoritesProvider(LocalStorage())..loadFavorites(),
        ),

        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],

      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            title: 'Product Catalogue',

            theme: AppTheme.lightTheme,

            darkTheme: AppTheme.darkTheme,

            themeMode: themeProvider.themeMode,

            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
