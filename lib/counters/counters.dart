import 'package:flutter/material.dart';
import '../app_state.dart';
import 'counter_cont.dart';
import 'package:provider/provider.dart';

class Counters extends StatefulWidget {
  Counters({Key key, this.title, this.count}) : super(key: key);

  final String title;
  final int count;

  @override
  _CountersState createState() => _CountersState();
}

class _CountersState extends State<Counters> {
  TextEditingController _counterTitleController;
  int _counterValue = 0;
  String _counterTitle = "Title";

  @override
  void initState() {
    super.initState();
    _counterTitleController = new TextEditingController(text: 'Title');
  }

  void _incrementCounter() {
    setState(() {
      _counterValue++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counterValue >= 0 ? _counterValue-- : _counterValue;
    });
  }

  void _changeTitle(text) {
    setState(() {
      _counterTitle:
      text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return SafeArea(
      child: Scaffold(
          appBar:AppBar(
              title: TextField(controller: _counterTitleController),
              actions: <Widget>[
                IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]),
          body:Column(
            children:appState.counters
                .map((counter) => CounterCont(
              counter: counter,
            ))
                .toList(),
            )
      ),
    );
  }
}