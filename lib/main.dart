import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart';
import 'counter_class.dart';
import 'home_counter_cont.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

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
  runApp(ChangeNotifierProvider<AppState>(
      create: (context) => AppState(), child: MrCounter()));
}

class MrCounter extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // used for  multiple states
    // https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#our-example-
//    return MultiProvider(
//      providers: [],
//    )
    return MaterialApp(
      title: 'Mr. Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Mr. Counter"), actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    print('open settings');
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
                    children: appState.counters
                        .map((counter) => HomeCounterCont(
                              counter: counter,
                            ))
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Counters()),
                              );
                            },
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

class Counters extends StatefulWidget {
  Counters({Key key, this.title, this.count}) : super(key: key);

  final String title;
  final int count;

  @override
  _CountersState createState() => _CountersState();
}

class _CountersState extends State<Counters> {
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
    final appState = Provider.of<AppState>(context);

    return SafeArea(
      child: Scaffold(
          appBar:AppBar(
            title: TextField(controller: _counterTitleController),
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.list),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]),
        body:Column(children: <Widget>[
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("$_counterValue")),
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
    ),
    );
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
