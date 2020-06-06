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
//      _counterValue++;
  }

  void _decrementCounter() {
//      _counterValue >= 0 ? _counterValue-- : _counterValue;
  }

  // When you click checkbox on home screen
  // select what appears on next screen
  updateSelected(int id, bool value) {
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    counters[selectedIndex].selected = value;

    notifyListeners();
  }
}