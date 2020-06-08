// data object for counter
class GroupClass {
  int id; // unique id
  List counters; // list of counter ID's to put in
  String title; // title of group

  // String color; // color to make group

  // constructor
  // with curly brackets we need to name them
  // without you have to make sure is in order
  CounterClass({this.count, this.title, this.id, this.selected, this.incrementAmount});
}

// to make a new counter do the following:
// Counter( ${all properties} )
