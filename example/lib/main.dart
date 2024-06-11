import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_api/fake_store_api.dart';

void main() {
  /// Get repository instance from package
  /// You may prefer injecting this dependency with any state manager
  final productRepository = ProductRepositoryImpl(
    ProductService(),
  );
  runApp(MyApp(productRepository: productRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.productRepository});

  final ProductRepository productRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store Package Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(productRepository: productRepository),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key, required this.productRepository});

  final ProductRepository productRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<Either<String, List<ProductModel>>>(
        future: productRepository.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Nothing to show'));
          }
          final products = snapshot.data!.getOrElse(() => []);
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailScreen(
                        productId: product.id,
                        productRepository: productRepository,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.productRepository,
  });

  final int productId;
  final ProductRepository productRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: FutureBuilder<Either<String, ProductModel>>(
        future: productRepository.getProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Nothing to show'));
          }
          final product = snapshot.data!.getOrElse(ProductModel.empty);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 20.0, color: Colors.green),
                ),
                const SizedBox(height: 8.0),
                Text(product.description),
              ],
            ),
          );
        },
      ),
    );
  }
}
