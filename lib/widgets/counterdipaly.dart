import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class CounterDispaly extends StatelessWidget {
  CounterDispaly({ required this.count });
  final int count;

  @override
  Widget build(BuildContext context) {
      return Text('count: $count');
  }
}

class CounterIncrementor extends StatelessWidget{
  CounterIncrementor({this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon:  Icon(Icons.add),
      tooltip: "Increment",
    );
  }
}

class CounterN extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
      return _CounterState();
  }
}

class _CounterState extends State<CounterN> {
  int _counter = 0;
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterIncrementor(
          onPressed: _increment,
        ),
        CounterDispaly(count: _counter),
      ],
    );
  }
}