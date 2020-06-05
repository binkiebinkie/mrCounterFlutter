import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart';

// Create layout of page
// have counter increment
// have counter homepage
// create and remove counters
// hook up to firebase
// have user, counters
// create/delete/modify counter
// local storage?

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: TextField(controller: _counterTitleController),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    print('homescreen');
                  })
            ]),
        body: Column(children: <Widget>[
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
        ]),
      ),
    );
  }
}

//stful
class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counterCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
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
