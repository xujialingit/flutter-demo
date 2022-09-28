//Flutter的弹窗 AlertDialog Widget
/*
const AlertDialog({
    Key? key,
    this.title, //弹窗标题
    this.titlePadding, //弹窗边距
    this.titleTextStyle, //文字风格
    this.content, //弹窗内容
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0), //内容边距
    this.contentTextStyle, //内容风格
    this.actions, //确认展示结果
    this.actionsPadding = EdgeInsets.zero,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.alignment,
    this.scrollable = false,
  })
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AlertDialogDemoState();
  }
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  void _showAlert() async{ //异步弹窗
    var res = await showDialog(
      context: context,
      builder: (BuildContext context){ //builder构建方法，传入BuildContext
        //默认风格弹窗
        // return AlertDialog(
        //   title: Text("弹窗的标题"),
        //   content: Text("弹框的文本"),
        //   actions: [
        //     TextButton(onPressed: (){
        //       Navigator.of(context).pop(true); //第一种返回方式，of上下文然后pop关闭，并返回一个true
        //     }, child: Text("确定")),
        //     TextButton(onPressed: (){
        //       Navigator.pop(context, false);//第二种返回方式，先pop关闭。然后用of链接上线问，并返回一个false
        //     }, child: Text("取消"))
        //   ],
        // );

        //ISO风格弹窗
        return CupertinoAlertDialog(
          title: Text("标题"),
          content: Text("内容！"),
          actions: [
            TextButton(onPressed: (){
                Navigator.of(context).pop(true); //第一种返回方式，of上下文然后pop关闭，并返回一个true
              }, child: Text("确定")),
              TextButton(onPressed: (){
                Navigator.pop(context, false);//第二种返回方式，先pop关闭。然后用of链接上线问，并返回一个false
              }, child: Text("取消"))
          ],
        );
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗展示"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: _showAlert, child: Text("对话框"))
        ],
      ),
    );
  }
}