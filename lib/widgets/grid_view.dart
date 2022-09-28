//Flutter 网格布局 GridView Widget:
/*
GridView({
    Key? key,
    Axis scrollDirection = Axis.vertical, //展示方向，默认垂直
    bool reverse = false, //是否反向
    ScrollController? controller, //滑动控制器
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false, //是否跟随子组件显示最大高度
    EdgeInsetsGeometry? padding,
    required this.gridDelegate,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
  })
* */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("网格布局"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 横向最大展示个数
          mainAxisSpacing: 10, // 横向间距
          crossAxisSpacing: 10, //纵向间距
        ),
        children: [
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Color.fromARGB(255, 85, 76, 51),
          ),
          Container(
            color: Color.fromARGB(255, 14, 223, 125),
          ),
          Container(
            color: Color.fromARGB(255, 42, 45, 209),
          ),
        ],
      ),
    );
  }

}