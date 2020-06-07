import 'package:flutter/material.dart';
import '../app_state.dart';
import 'counter_button.dart';
import 'counter_class.dart';
import 'package:provider/provider.dart';

class CounterCont extends StatefulWidget {
  CounterCont({Key key, this.counter}) : super(key: key);
  final CounterClass counter;

  @override
  _CounterContState createState() => _CounterContState();
}

class _CounterContState extends State<CounterCont> {
  _CounterContState({this.counter});
  final CounterClass counter;
  final _counterTitleController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    _counterTitleController.text = appState.counters[widget.counter.id].title;

    return Expanded(
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _counterTitleController,
//                  onChanged: (text) {},
                  onSubmitted: (value) {
                    appState.updateTextTitle(
                        widget.counter.id, _counterTitleController.text);
                  },
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                          "${appState?.counters[widget.counter.id].count}")),
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
                counterId: widget.counter.id,
                counterText: '-',
              ),
              CounterButton(
                counterId: widget.counter.id,
                counterText: '+',
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
