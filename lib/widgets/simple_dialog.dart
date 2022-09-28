//Flutter 的弹框（simpleDialog） Widget
//展示数据的弹框数据

/*
const SimpleDialog({
    Key? key,
    this.title, //弹框标题
    this.titlePadding = const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
    this.titleTextStyle,
    this.children,
    this.contentPadding = const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 16.0),
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
  })
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleDialogDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SimpleDialogDemoState();
  }
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  List<int> list = [];

  @override
  void initState() {
    for(int i = 0; i < 20; i++) {
      list.add(i);
    }
    super.initState();
  }

  void _showAlert() async {
    var res = await showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("弹出框标题"),
        content: Text("弹出框内容" * 10),
        actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop(true);
            }, child: Text("确定")),
          TextButton(onPressed: (){
            Navigator.pop(context,false);
          }, child: Text("取消"))
        ],
      );
    });
    print(999);
   }

  void _showSimple() async {
    var res = await showDialog(
      barrierDismissible: false, //点击空白不会关闭
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: const Text("SimpleDialog title"),
          children: [
            ...list.map((e) => GestureDetector(
              child: Text(e.toString()),
              onTap: () {
                Navigator.pop(context,e);
              },
            )).toList()
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("弹框展示"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Column(
          children: [
            ElevatedButton(onPressed: _showAlert, child: const Text("对话框")),
            const SizedBox(height: 5,),
            ElevatedButton(onPressed: _showSimple, child: const Text("列表框"))
          ],
         ),
      )
    );
  }
}