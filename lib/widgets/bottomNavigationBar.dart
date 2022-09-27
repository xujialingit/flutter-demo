
//Flutter的底部选项卡
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtomNavigatorBarDemo extends StatefulWidget {
  const ButtomNavigatorBarDemo({Key? key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _ButtonNavigatorBarDemoState();
  }
}

class _ButtonNavigatorBarDemoState extends State<ButtomNavigatorBarDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("底部选项卡"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "新增"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的"),
            BottomNavigationBarItem(icon: Icon(Icons.remove), label: "减少"),
          ],
        currentIndex: _index,
        onTap: (v) {
            setState(() {
              _index = v;
            });
        },
      ),
      body: Center(child: Text(_index.toString()),),
    );
  }
}