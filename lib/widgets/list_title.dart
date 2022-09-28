//Flutter的ListTile Widget

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("卡片数据展示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: const [
             ListTile(
              tileColor: Color.fromARGB(255, 204, 184, 128),
              leading: Icon(Icons.token_sharp),
               title: Text("Brath"),
               textColor: Color.fromARGB(255, 49, 54, 42),
               subtitle: Text("Fluter卡片数据演示1"),
               trailing: Icon(Icons.account_circle_rounded),
            ),
            SizedBox(height: 8,),
          ListTile(
            tileColor: Color.fromARGB(255, 197, 124, 55),
            leading: Icon(Icons.token_sharp),
            title: Text("Braht 2"),
            textColor: Color.fromARGB(255, 49, 54, 42),
            subtitle: Text("Flutter卡片数据演示数据 2 "),
            trailing: Icon(Icons.account_circle_rounded),
          ),
          ],
        ),
      ),
    );
  }
}