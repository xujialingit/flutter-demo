//Flutter的表格(Table) Widget:
//Flutter 为我们提供了Table还有DataTable这两个常用的widget来展示我们的表格

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TableDemoState();
  }
}

class _TableDemoState extends State<TableDemo> {
  List<Map> list = [];
  int _sortColumnIndex = 0; //初始化排序索引
  bool _sortAscending = true; //初始化排序方式

  @override
  void initState() {
    for(int i = 0; i < 10; i++) {
      list.add({
        "name": "b" * i + "i",
        "gender": i % 1 == 0 ? "男" : "女",
        "isSelect":false,
        "age": i.toString() + i.toString()
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("表格展示",
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            //普通表格
            child: Table(
              border: TableBorder.all(
                color: Colors.green,
              ),
              children: list.map((e) => TableRow(
                  children: [
                    Text(e["name"], textAlign: TextAlign.center,),
                    Text(e["gender"]),
                  ]
              )).toList(),
            ),
          ),
          //H5表格 常用---》 可排序 可选中
          Padding(
            padding: EdgeInsets.all(10),
            child: DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              columns:[
                DataColumn(
                  onSort: (columnIndex, ascending){
                    _sortAscending = ascending;
                    _sortColumnIndex = columnIndex;
                    list.sort((begin,end){
                      if(!ascending) {
                        var c = begin;
                        begin = end;
                        end = c;
                      }
                      return begin["name"].toString().length.compareTo(end["name"].toString().length);
                    });

                  },
                  label: Text("姓名"),
                ),
                DataColumn(
                  label: Text("性别")
                ),
                DataColumn(
                    label: Text("年龄")
                )
              ],
              rows: list.map((e) => DataRow(
                selected: e["isSelect"],
                onSelectChanged: (v) {
                    setState(() {
                      if(e["isSelect"] != v) {
                        e["isSelect"] = v;
                      }
                    });
                },
                cells: [
                  DataCell(Text(e["name"])),
                  DataCell(Text(e["gender"])),
                  DataCell(Text(e["age"]))
                ]
              )).toList()
            ),
          )
        ],
      )
    );
  }
}