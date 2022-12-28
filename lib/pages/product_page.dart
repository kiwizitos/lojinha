import 'package:flutter/material.dart';
import 'package:lojinha/providers/products_list.dart';
import 'package:lojinha/utils/routes.dart';
import 'package:lojinha/widgets/app_drawer.dart';
import 'package:lojinha/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) {
    return Provider.of<ProductsList>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus produtos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.PRODUCT_FORM,
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<ProductsList>(
        builder: (context, products, _) => RefreshIndicator(
          onRefresh: () => _refreshProducts(context),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.itemsCount,
              itemBuilder: (context, i) => Column(
                children: [ProductItem(products.items[i]), Divider()],
              ),
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
