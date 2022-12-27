import 'package:flutter/material.dart';
import 'package:lojinha/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador'),
      ),
      body: Column(
        children: [
          Text(provider?.state.value.toString() ?? '0'),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.increase();
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                provider?.state.decrease();
              });
            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
