import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/product_card.dart';
import '../../widgets/empty_state.dart';
import '../favorites/favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  bool _ascending = true;

  String _selectedCategory = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      context.read<ProductProvider>().fetchProducts();

      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
          context.read<ProductProvider>().loadMoreProducts();
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalogue'),

        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                onPressed: () {
                  themeProvider.toggleTheme();
                },
                icon: Icon(
                  themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
              );
            },
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                TextField(
                  controller: _searchController,

                  decoration: InputDecoration(
                    hintText: 'Search products...',

                    prefixIcon: const Icon(Icons.search),

                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              _searchController.clear();

                              context.read<ProductProvider>().searchProducts(
                                '',
                              );

                              setState(() {});
                            },
                            icon: const Icon(Icons.clear),
                          )
                        : null,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onChanged: (value) {
                    context.read<ProductProvider>().searchProducts(value);

                    setState(() {});
                  },
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<bool>(
                        initialValue: _ascending,

                        decoration: InputDecoration(
                          labelText: 'Sort Price',

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        items: const [
                          DropdownMenuItem(
                            value: true,
                            child: Text('Low → High'),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: Text('High → Low'),
                          ),
                        ],

                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _ascending = value;
                            });

                            context.read<ProductProvider>().sortByPrice(value);
                          }
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Consumer<ProductProvider>(
                        builder: (context, provider, child) {
                          return DropdownButtonFormField<String>(
                            initialValue: _selectedCategory.isEmpty
                                ? null
                                : _selectedCategory,

                            hint: const Text('Category'),

                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),

                            items: provider.categories.map((category) {
                              return DropdownMenuItem(
                                value: category,
                                child: Text(
                                  category,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),

                            onChanged: (category) {
                              if (category != null) {
                                setState(() {
                                  _selectedCategory = category;
                                });

                                context
                                    .read<ProductProvider>()
                                    .filterByCategory(category);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.errorMessage != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Icon(Icons.error_outline, size: 70),

                        const SizedBox(height: 16),

                        const Text(
                          'Something went wrong',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 20),

                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<ProductProvider>().fetchProducts();
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (provider.products.isEmpty) {
                  return const EmptyState(
                    icon: Icons.search_off,
                    title: 'No Products Found',
                    message: 'Try searching with another keyword.',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    await context.read<ProductProvider>().fetchProducts();
                  },

                  child: ListView.builder(
                    controller: _scrollController,

                    padding: const EdgeInsets.all(16),

                    itemCount:
                        provider.products.length +
                        (provider.isLoadingMore ? 1 : 0),

                    itemBuilder: (context, index) {
                      if (index == provider.products.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final product = provider.products[index];

                      return ProductCard(product: product);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
