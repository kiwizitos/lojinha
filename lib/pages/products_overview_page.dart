import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/providers/cart.dart';
import 'package:lojinha/providers/products_list.dart';
import 'package:lojinha/utils/routes.dart';
import 'package:lojinha/widgets/app_drawer.dart';
import 'package:lojinha/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  favorite,
  all,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductsList>(
      context,
      listen: false,
    ).loadProducts().then((value) => {setState(() => _isLoading = false)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Favoritados'),
                value: FilterOptions.favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.all,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.CART);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (context, cart, _) => Badge(
              position: const BadgePosition(top: 2, end: 2),
              badgeContent: Text(
                cart.itemsCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              child: _,
            ),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductGrid(_showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}
