import 'package:flutter/material.dart';
import '../app_state.dart';
import 'counter_button.dart';
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
          body:Column(children: <Widget>[
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text("$_counterValue")),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0125),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CounterButton(
                    counterText: '-',
                    fn: _decrementCounter,
                  ),
                  CounterButton(
                    counterText: '+',
                    fn: _incrementCounter,
                  ),
                ],
              ),
            ),
          ])
      ),
    );
  }
}