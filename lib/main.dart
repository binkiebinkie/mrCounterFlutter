import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart';
import 'counter_class.dart';
import 'home_counter_cont.dart';

// - Create layout of page
// - have counter increment
// - have counter homepage
// Check counters to select them
// press GO to switch to checkbox screen w multiple checkboxes
// hook up counters to actual counter state

// create and remove counters
// hook up to firebase
// have user, counters
// create/delete/modify counter
// local storage?

// stretch goals:
// hook up to firebase w accounts?

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
  // CounterClass from counter_class.dart
  List<CounterClass> counters = [
    CounterClass(
      count: 0,
      title: "Title of Counter",
      id: 0,
      selected: false,
    ),
    CounterClass(
      count: 0,
      title: "Second Counter",
      id: 1,
      selected: false,
    ),
  ];

//  updateSelected() { setState(() {}) }


  @override
  Widget build(BuildContext context) {
    print(counters);

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
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              color: Colors.grey[200],
              child: Column(children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: counters
                        .map((counter) => HomeCounterCont(counter: counter))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                            onPressed: () {},
                            color: Colors.blue[300],
                            materialTapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // removes default container padding at bottom...?!
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Go".toUpperCase(),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.arrow_forward, size: 20)
                              ],
                            )),
                      ),
                    ],
                  ),
                )
              ]),
            )));
  }
}

class Counter extends StatefulWidget {
  Counter({Key key, this.title, this.count}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int count;

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
