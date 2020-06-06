import 'package:flutter/material.dart';
import '../app_state.dart';
import 'counter_button.dart';
import 'counter_class.dart';
import 'package:provider/provider.dart';

class CounterCont extends StatelessWidget {
  final CounterClass counter;

  CounterCont({this.counter});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Row(children: <Widget>[
      Expanded(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: FittedBox(
                    fit: BoxFit.fitHeight, child: Text("${appState.counters[counter.id].count}")),
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
              counterId:counter.id,
              counterText: '-',
            ),
            CounterButton(
              counterId:counter.id,
              counterText: '+',
            ),
          ],
        ),
      ),
    ]);
  }
}
