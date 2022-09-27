//var res = await Navigator.of(context).push()

import "package:flutter/material.dart";

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        elevation: 10.0,
        centerTitle: true,
      ),
      body: ElevatedButton( //登录按钮
        onPressed: () async {
          var res = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MenuPage(menuTitle: "菜单");
              },
              settings: RouteSettings( //路由设置
                name: "参数",
                arguments: "我是参数",//向目标传参的数据
              ),
              maintainState: false,
              fullscreenDialog: true,
            )
          );
          print(res);
        },
        child: Text("登录"),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  const MenuPage({Key? key, required this.menuTitle}):super(key:key);

  @override
  Widget build(BuildContext context) {
    //通过ModalRoute.of(context)?.settings.arguments获取传参
    dynamic arguments = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(menuTitle + " " + arguments),
      ),
      body: ElevatedButton(
        onPressed: (){
          Navigator.of(context).pop("Brath");
        },
        child: Text("返回按钮"),
      ),
    );
  }
}

//静态路由
class StaticRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", //默认加载的界面
      routes: {
        "/":(context) => LoginPage(),
        "Menu":(context)=>MenuPage(menuTitle: "菜单"),
      },
      onGenerateRoute: (RouteSettings s) {//路由拦截器
        print(s.name);
      },
    );
  }
}

