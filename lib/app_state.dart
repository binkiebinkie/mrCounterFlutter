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
      incrementAmount: 1,
    ),
    CounterClass(
      count: 0,
      title: "1 Counter",
      id: 1,
      selected: false,
      incrementAmount: 1,
    ),
    CounterClass(
      count: 0,
      title: "3 Counter",
      id: 2,
      selected: false,
      incrementAmount: 1,
    ),
  ];

  // number of counters selected
  int numberOfSelected = 0;
  bool flirtingOn = false;

  // increment/decrement count, depending on text passed
  void updateCount(int id, String counterText) {
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    counters[selectedIndex].count = counterText == "+"
        ? counters[selectedIndex].count + counters[selectedIndex].incrementAmount
        : counters[selectedIndex].count - counters[selectedIndex].incrementAmount;
    notifyListeners();
  }

  // When you click checkbox on home screen
  // select what appears on next screen
  homeUpdateSelected(int id, bool value) {
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    counters[selectedIndex].selected = value;

    // also update the number of selected checkboxes
    int tempSelected = 0;
    counters.forEach((counter) => counter.selected ? tempSelected += 1 : null);
    numberOfSelected = tempSelected;
    notifyListeners();
  }

  void updateCounterTitle(int id, String title) {
    int selectedIndex = counters.indexWhere((counter) => counter.id == id);
    counters[selectedIndex].title = title;

    notifyListeners();
  }
}
