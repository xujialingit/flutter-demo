import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Flutter 为我们提供了ListView这个widget来展示我们的列表

/*
ListView({
    Key? key,
    Axis scrollDirection = Axis.vertical, //滑动方向，默认垂直
    bool reverse = false, //是否反向，默认否
    ScrollController? controller, //监听滑动距离回调 控制器
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false, //限制listview的高度为子组件的高度
    EdgeInsetsGeometry? padding,
    this.itemExtent, //设置list展示间距
    this.prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  })
* */

class ListViewDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return _ListViewDemoState();
  }
}

class _ListViewDemoState extends State<ListViewDemo> {
  ScrollController _controller = ScrollController();
  bool show = false;
  List<int> list = [];

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      print(_controller.offset);
      if(_controller.offset >= 100 && show==false) {
        setState(() {
          show = true;
        });
      }else if(_controller.offset < 100 && show == true) {
        setState(() {
          show = false;
        });
      }
    });
    for(var i = 0; i < 100; i++) {
      list.add(i);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future _onRefresh() async{
     await Future.delayed(
       Duration(seconds: 3),
       () {
        print("三");
       }
     );
     return "三";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("滚动列表"),
      ),
      floatingActionButton: show ? FloatingActionButton(
        child: Icon(Icons.align_vertical_top_outlined),
        onPressed: (){
          _controller.animateTo(0, duration: Duration(microseconds: 300), curve: Curves.slowMiddle);
        },
      ) : null,
      body: Scrollbar(
        controller: _controller,
        child: RefreshIndicator(
          // child: ListView.builder(
          //   itemBuilder: (BuildContext context, int index) {
          //     if(index == 2) {
          //       return Icon(Icons.add);
          //     }
          //     return Text(list[index].toString());
          //   },
          //   itemCount: list.length,
          // ),
          child: ListView(
            shrinkWrap: true, //限制listView的高度为子组件的高度
            itemExtent: 50, //设置list展示间距
            reverse: false,
            children: list.map((e) => Text(e.toString())).toList(),
          ),
          onRefresh: _onRefresh,
        )
      ),
    );
  }
}
