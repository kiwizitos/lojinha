import 'package:flutter/material.dart';
import 'package:lojinha/models/product.dart';
import 'package:lojinha/providers/products_list.dart';
import 'package:lojinha/widgets/product_grid_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key, required this.showFavoriteOnly});

  final bool showFavoriteOnly;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsList>(context);
    final List<Product> loadedProducts =
        showFavoriteOnly ? provider.favoriteItems : provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loadedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        value: loadedProducts[i],
        child: ProductGridItem(),
      ),
    );
  }
}
