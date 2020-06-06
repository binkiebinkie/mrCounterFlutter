import 'package:flutter/material.dart';
import 'package:hardware_buttons/hardware_buttons.dart';
import 'counters/counter_class.dart';
import 'home/home_counter_cont.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'home/home.dart';

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

