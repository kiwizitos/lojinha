import 'package:flutter/material.dart';
import 'package:lojinha/providers/order_list.dart';
import 'package:lojinha/widgets/app_drawer.dart';
import 'package:lojinha/widgets/order.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Pedidos'),
      ),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (context, i) => OrderWidget(
          order: orders.items[i],
        ),
      ),
      drawer: const AppDrawer(),
    );
  }
}
