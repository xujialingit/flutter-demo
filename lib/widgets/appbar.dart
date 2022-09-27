import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Flutter中

/*
1.MateriaApp是Flutter的根节点，flutter规定必须要使用MaterialApp来作为根节点
2.在MateriaApp可以设置路由，每个子页面必须由Scaffold来包裹
3.每个Scaffold包含两个部分 appBar(头部)，body(展示体)
*/

//Scaffold中的Appbar有很多特性：

class AppbarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AppbarDemoState();
  }
}

class _AppbarDemoState extends State<AppbarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //设置左侧图标
          onPressed: (){
            print("点击了");
          },
          icon: Icon(Icons.home),
        ),
        title: Text(
          "演示",
          style: TextStyle(fontSize: 15),
        ),
        actions: [ //右侧图标
          IconButton(onPressed: (){ print("点击了+"); }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){ print("点击了-"); }, icon: Icon(Icons.remove)),
          IconButton(onPressed: (){ print("点击了灯"); }, icon: Icon(Icons.wb_iridescent_rounded)),
        ],
      ),
    );
  }
}

//fluuter 顶部TabBar选项卡
class AppBarTabBarDemo extends StatefulWidget{
  List <Widget> widgets = [FlutterView(), AndroidView(),IOSView()];
  State<StatefulWidget> createState() {
    return _AppBarTabBarDemoState();
  }
}

class _AppBarTabBarDemoState extends State<AppBarTabBarDemo> with SingleTickerProviderStateMixin {
  List tabs = ["Fullter", "Andirord", "IOS"]; //选项卡数组
  late TabController _controller = TabController(length: tabs.length, vsync: this);

  //选项卡索引
  int _index = 0;

  @override
  void initState() {
    _controller = TabController(length: tabs.length, initialIndex: _index,vsync: this);
    _controller.addListener(() {
      setState(() {
        _index = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:const IconButton(
            onPressed: null,
            icon: Icon(Icons.home),
          ),
          actions: const <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.remove),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(Icons.wb_iridescent_rounded),
            ),
          ],
          elevation: 10.0,
          bottom: TabBar(
            controller: _controller,
            tabs: tabs.map((e) => Tab(
              text: e,
            )).toList(),
          ),
        ),
        // body: TabBarView(
        //   children: widget.widgets,
        //   controller: _controller,
        // )
        body: Drawer(
          child: MediaQuery.removePadding(context: context, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 40), child: Text("Brath"),)
            ],
          )),
        ),
    );
  }
}


class FlutterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("FlutterView"),
    );
  }
}

class AndroidView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("AndroidView"),
    );
  }
}

class IOSView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("IOSView"),
    );
  }
}