import 'package:flutter/material.dart';
import '../app_state.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class CounterButton extends StatelessWidget {
  CounterButton({this.counterText,this.counterId});
  final String counterText;
  final int counterId;

  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;

    return  FlatButton(
        onPressed: () {
          appState.count(counterId,counterText);
        },
        color: Colors.purple[200],
        shape: CircleBorder(),
        padding: EdgeInsets.all(deviceHeight * 0.05),
        child: Text(counterText),
      );
  }
}
