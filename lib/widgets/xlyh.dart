//性能优化

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerformanceDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PerformanceDemoState();
  }
}

class _PerformanceDemoState extends State<PerformanceDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("性能优化专题"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.red,
          ),

        ],
      ),
    );
  }
}