import 'package:flutter/material.dart';
import 'package:lojinha/providers/cart.dart';
import 'package:lojinha/providers/order_list.dart';
import 'package:lojinha/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    label: Text(
                      'R\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              ?.color),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderList>(
                        context,
                        listen: false,
                      ).addOrder(cart);

                      cart.clear();
                    },
                    style: TextButton.styleFrom(
                        textStyle: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    child: Text('Comprar'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, i) => CartItemWidget(cartItem: items[i]),
            ),
          ),
        ],
      ),
    );
  }
}
