import 'package:flutter/material.dart';

class CounterState {
  int _value = 0;

  void increase() => _value++;

  void decrease() => _value--;

  int get value => _value;

  bool difference(CounterState old) {
    return old.value != _value;
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({super.key, required Widget child}) : super(child: child);
  final CounterState state = CounterState();

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.difference(state);
  }
}
