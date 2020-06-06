import 'package:flutter/material.dart';


class CounterButton extends StatelessWidget {
  CounterButton({this.counterText, this.fn});
  final String counterText;
  final Function fn;

  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        fn();
      },
      color: Colors.purple[200],
      shape: CircleBorder(),
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.225),
      child: Text(counterText),
    );
  }
}
