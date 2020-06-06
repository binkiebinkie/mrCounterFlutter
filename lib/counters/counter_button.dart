import 'package:flutter/material.dart';
import '../app_state.dart';
import 'package:provider/provider.dart';

class CounterButton extends StatelessWidget {
  CounterButton({this.counterText,this.counterId});
  final String counterText;
  final int counterId;

  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return FlatButton(
      onPressed: () {
        appState.count(counterId,counterText);
      },
      color: Colors.purple[200],
      shape: CircleBorder(),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.225),
      child: Text(counterText),
    );
  }
}
