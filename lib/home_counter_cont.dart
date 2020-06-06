import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart';
import 'counter_class.dart';
import 'constants.dart';

class HomeCounterCont extends StatelessWidget {
  final CounterClass counter;
  HomeCounterCont({this.counter});

  @override
  Widget build(BuildContext context) {
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(deviceWidth * 0.03, deviceHeight * 0.0125,
            deviceWidth * 0.03, deviceHeight * 0.0125),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    counter.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '${counter.count}',
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
              Checkbox(
                value: counter.selected,
                onChanged: (checked){print('checked');},
              )

            ]),
      ),
    );
  }
}