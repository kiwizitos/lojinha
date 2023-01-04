import 'package:flutter/material.dart';
import 'package:lojinha/pages/auth_or_home_page.dart';
import 'package:lojinha/pages/cart_page.dart';
import 'package:lojinha/pages/orders_page.dart';
import 'package:lojinha/pages/product_detail_page.dart';
import 'package:lojinha/pages/product_form_page.dart';
import 'package:lojinha/pages/product_page.dart';
import 'package:lojinha/providers/auth.dart';
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
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductsList>(
          create: (_) => ProductsList(),
          update: (context, auth, previous) {
            return ProductsList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (context, auth, previous) {
            return OrderList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Lojinha',
        theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.orange,
          ),
        ),
        // home: ProductsOverviewPage(),
        routes: {
          Routes.AUTH_OR_HOME: (context) => const AuthOrHomePage(),
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
