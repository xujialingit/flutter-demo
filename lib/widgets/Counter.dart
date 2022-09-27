import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class Counter extends StatefulWidget {
  @override
  _CounterState createState()=> _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(onPressed: _increment, icon: Icon(Icons.add)),
        Text('Counter: $_counter'),
      ],
    );
  }
}