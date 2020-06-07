import 'package:flutter/material.dart';
import '../app_state.dart';
import 'counter_cont.dart';
import 'package:provider/provider.dart';

class Counters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    print(appState.counters[0].id);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Counters'),
          ),
          body: Container(
            child: Column(
              children: appState.counters
                  .map((counter) => counter.selected? CounterCont(
                        counter:counter
                      ) : SizedBox.shrink())
                  .toList(),
            ),
          )),
    );
  }
}
