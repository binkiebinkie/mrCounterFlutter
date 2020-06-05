import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart';
import 'counterClass.dart';
import 'constants.dart';

// Create layout of page
// have counter increment
// have counter homepage
// create and remove counters
// hook up to firebase
// have user, counters
// create/delete/modify counter
// local storage?

void main() {
  runApp(MrCounter());
}

class MrCounter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr. Counter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

//getWidth() => MediaQuery.of(context).size.width;

class _HomeState extends State<Home> {
  // CounterClass from counterClass.dart
  List<CounterClass> counters = [
    CounterClass(count: 0, title: "Title of Counter"),
    CounterClass(count: 0, title: "Second Counter"),
  ];

  Widget homeCounter(counter) {
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
              IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    print('homescreen');
                  }),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Mr. Counter"), actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    print('homescreen');
                  })
            ]),
            body: Container(
              color:Colors.grey[200],
              child: Column(
                children:
                    counters.map((counter) => homeCounter(counter)).toList(),
              ),
            )));
  }
}

class Counter extends StatefulWidget {
  Counter({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Column(children: <Widget>[
      AppBar(
          title: TextField(controller: _counterTitleController),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  print('homescreen');
                })
          ]),
      Column(children: <Widget>[
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                    child: Container(
                        color: Colors.purple[400],
                        child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text("$_counterValue"))))
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
    ]);
  }
}

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
