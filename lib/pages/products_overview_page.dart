import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lojinha/providers/cart.dart';
import 'package:lojinha/utils/routes.dart';
import 'package:lojinha/widgets/app_drawer.dart';
import 'package:lojinha/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewPage extends StatefulWidget {
  const ProductsOverviewPage({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

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
                value: FilterOptions.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
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
      body: ProductGrid(
        showFavoriteOnly: _showFavoriteOnly,
      ),
      drawer: const AppDrawer(),
    );
  }
}
