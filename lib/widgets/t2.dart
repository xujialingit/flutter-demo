import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class TutorialHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件
    return Scaffold(
      appBar: AppBar(
        leading:const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
          tooltip: "Mavigations menu",
        ),
        title: const Text("Example title"),
        actions: const <Widget>[
           IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
           tooltip: "Search",
          )
        ],
      ),
      //body占据屏幕的大部分
      body: const Center(
        child: Text("Hello World!"),
      ),
      floatingActionButton:const FloatingActionButton(
        tooltip: "Add",
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}