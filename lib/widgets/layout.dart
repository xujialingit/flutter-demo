import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Flutter布局

//textDirection: TextDirection.ltr //组件排序方式
//mainAxisSize: MainAxisSize.max //主轴最大值
//mainAxisAlignment:MainAxisAlignment.spaceEvenly //主轴布局
//crossAxisAlignment: CorssAxisAlignment.start    //纵轴排列方式

//Column --> 纵向  纵轴的宽度默认使用子组件最大宽度


class CloumnLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloumn布局联系"),
      ),
      body: Container(
        color: Colors.grey,
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              color:Colors.red,
            ),
            Container(
              color: Colors.green,
              width: 150,
              height: 150,
            ),
            Container(
              color: Colors.yellow,
              width: 100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class RowLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row布局练习"),
      ),
      body: Container(
        color: Colors.grey,
        child: Row(
          textDirection: TextDirection.ltr, //组件排序方式
          mainAxisSize: MainAxisSize.max,  //主轴最大值
          crossAxisAlignment: CrossAxisAlignment.start, //纵轴排列方式
          children: [
            Container(
              width: 100,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 150,
              height: 100,
              color: Colors.green,
            ),
            Container(
              width: 100,
              height: 100,
              color:Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}

//Flex 这个widget为制造弹性布局
//Flex 默认 必传方向 Axis
//children 使用Expanded来包裹，可以设置flex权重，根据数字大小来设置权重

class FlexLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex布局练习"),
      ),
      body: Container(
        color: Colors.grey,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child:
            Container(
              width: 100,
              height: 20,
              color: Colors.red,
            ),flex: 1,),
            Expanded(child:
            Container(
              width: 100,
              height: 200,
              color: Colors.green,
            ),flex:3),
            Expanded(child:
            Container(
              width: 100,
              height: 200,
              color: Colors.yellow,
            ),flex: 2,)
          ],
        ),
      ),
    );
  }
}

//Warp 流式布局
class WarpLayoutDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _WrapDemoState();
  }
}

class _WrapDemoState extends State<WarpLayoutDemo> {
  var list = <int>[];

  @override
  void initState() {
    super.initState();
    for(var i = 0; i< 19; i++) {
      list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 10.0,
      runSpacing: 20.0,
      children: list.map((e) => Container(
        height: 100,
        width: 100,
        child: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 20
          ),
        ),
        color: Colors.blue,
      )).toList(),
    );
  }
}

//层叠布局 Stack
class StackLayoutDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center, //居中布局
        children: [
          Container(
            color: Colors.green,
            width: 150,
            height: 150,
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Positioned(
            child: Container(
              color: Colors.yellow,
              width: 300,
              height: 300,
            ),
            top: 50,
            left: 10,
          ),
        ],
      ),
    );
  }
}

//定位布局 Positioned
class AlignLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     width: 200,
     height: 200,
     color: Colors.green,
     child: Align(
       alignment: Alignment.center,
       child: FlutterLogo(
         size: 60,
       ),
     ),
   );
  }
}

//内外边距
class PaddingAndMarginLayoutDemo extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      // margin: EdgeInsets.only(left: 10), //only left有10的边距
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 0),
      alignment: Alignment.center,
      color: Colors.red,
      child: Text("我有边距"),
    );
  }
}

//Flutter 尺寸限制容器 ConstrainedBox widget:
//

class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: 100,
          minHeight: 50,
          minWidth: 50
        ),
      child:  Container(
        width: 20,
        height: 20,
        color: Colors.red,
      ),
    );
  }
}


//SizeBox 如果父容器指定了宽高，那么子组件不可以修改宽高
class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(
        color: Colors.red,
        width: 200,
        height: 200,
      ),
    );
  }
}

//Flutter装饰器  -->DecoratedBox
class BoxDecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(//渐变色
            colors: [Colors.red, Colors.green]
          ),
          borderRadius: BorderRadius.circular(10.0), //原角度
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2.0,2.0),
              blurRadius: 2,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 100,
            right: 100,
            top: 20,
            bottom: 20
          ),
          child: Text(
            "渐变色~",
            style: TextStyle(
              color:Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


//Flutter小容器 Container--> widget
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100),
      width: 100,
      height: 100,
      child: Text("data"),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1, color: Colors.black),
        ),
        color: Colors.red,
      ),
      transform: Matrix4.rotationZ(0.5), //选择
    );
  }
}

