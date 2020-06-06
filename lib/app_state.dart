import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counters/counter_class.dart';

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

  void count(int id, String counterText) {
    print(id);
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    print(counters[selectedIndex].count);

    counters[selectedIndex].count = counterText == "+" ? counters[selectedIndex].count + 1 : counters[selectedIndex].count - 1;
    print(counters[selectedIndex].count);

    notifyListeners();
  }


  // When you click checkbox on home screen
  // select what appears on next screen
  updateSelected(int id, bool value) {
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    counters[selectedIndex].selected = value;

    notifyListeners();
  }
}