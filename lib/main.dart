import 'package:flutter/material.dart';
import 'package:lojinha/pages/cart_page.dart';
import 'package:lojinha/pages/orders_page.dart';
import 'package:lojinha/pages/product_detail_page.dart';
import 'package:lojinha/pages/product_form_page.dart';
import 'package:lojinha/pages/product_page.dart';
import 'package:lojinha/pages/products_overview_page.dart';
import 'package:lojinha/providers/cart.dart';
import 'package:lojinha/providers/order_list.dart';
import 'package:lojinha/providers/products_list.dart';
import 'package:lojinha/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeData tema = ThemeData(
    fontFamily: 'Lato',
    // backgroundColor: Colors.white,
    // scaffoldBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        ),
      ],
      child: MaterialApp(
        title: 'Lojinha',
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.red,
          ),
        ),
        // home: ProductsOverviewPage(),
        routes: {
          Routes.HOME: (context) => const ProductsOverviewPage(),
          Routes.PRODUCT_DETAIL: (context) => const ProductDetailPage(),
          Routes.CART: (context) => const CartPage(),
          Routes.ORDERS: (context) => const OrdersPage(),
          Routes.PRODUCTS: (context) => const ProductPage(),
          Routes.PRODUCT_FORM: (context) => const ProductFormPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
