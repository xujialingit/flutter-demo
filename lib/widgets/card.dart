//fluter Card

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardDemoState();
  }
}

class _CardDemoState extends State<CardDemo> {
  List<Map> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < 10; i++) {
      list.add(
        {
          "age": 10 + i,
          "name": "barth"+i.toString()
        }
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("卡片数据展示"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1,color: Colors.red),
            bottom: BorderSide(width: 1,color: Colors.red)
        )
        ),
        child: ListView.builder(itemBuilder: _itemBuilder, itemCount: list.length,),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      color: Colors.green,
      shadowColor: Colors.grey,
      elevation: 5.0,
      child: Column(
        children: [
          SizedBox(height: 8,),
          Text(list[index]["name"]),
          SizedBox(height: 8,),
          Text(list[index]["age"].toString())
        ],
      ),
    );
  }
}