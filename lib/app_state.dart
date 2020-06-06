import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_class.dart';

class AppState with ChangeNotifier {

  AppState();

  final List<CounterClass> counters = [
    CounterClass(
      count: 0,
      title: "Title of Counter",
      id: 0,
      selected: false,
    ),
    CounterClass(
      count: 0,
      title: "Second Counter",
      id: 1,
      selected: false,
    ),
  ];

  void _incrementCounter() {
//    setState(() {
//      _counterValue++;
//    });
  }

  void _decrementCounter() {
//    setState(() {
//      _counterValue >= 0 ? _counterValue-- : _counterValue;
//    });
  }

  updateSelected(int id, bool value) {
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    print(selectedIndex);
    print(value);
    counters[selectedIndex].selected = value;
    notifyListeners();
  }
}