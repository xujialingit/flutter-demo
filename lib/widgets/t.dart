import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class HelloWord extends StatelessWidget{
  const HelloWord({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Center(
        child: Text(
          "Hello World!",
          textDirection: TextDirection.ltr,
        ),
    );
  }
}

//基础Widget
//Flutter 有一套丰富、强大的基础widget，其中以下是很常用的

/*
Text: 带格式的文本

Row、Column： 这些具有弹性空间的布局类Widget可让在 水平（Row）和锤子(Column)方向灵活创建布局

Stack: 取代线性布局，Stack允许子widget堆叠，使用Positioned来定位他们相对于Stack的上下左右四条边的位置，基于 absolute positioning 布局模型设计的

Container:  创建矩形视觉元素，container可以装饰为一个BoxDecorations，如background,一个边框，一个阴影，也可以具有 margin, padding,和应用于起大小的约束(constrainints)，另外可以使用矩阵在三维空间中对其进行变换
*/

//简单Widget组合出其他的Widget
class MyAppBar extends StatelessWidget{
  MyAppBar(this.title);
  // Widget子内的字段往往都会定义为 “final"
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, //单位是逻辑像素，
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration:  BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
           const IconButton(
              onPressed: null,
              icon: Icon(Icons.menu),
              tooltip: "Navigation menu",
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: "Search",
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Material 是UI呈现的一张纸
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            const Text(
              "Example title",
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                "hello world",
                textDirection: TextDirection.ltr,
              ),
            ),
          )
        ],
      ),
    );
  }
}