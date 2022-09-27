import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _InputDemoState();
  }
}

class _InputDemoState extends State<InputDemo> {
  GlobalKey _key = GlobalKey<FormState>();

  TextEditingController _rootController = TextEditingController(); //账号控制器
  TextEditingController _passController = TextEditingController(); //密码控制器

  FocusNode _r = FocusNode(); //账号焦点
  FocusNode _p = FocusNode(); //密码焦点

  @override
  void dispose() {
    super.dispose();
    _rootController.dispose();
    _passController.dispose();
    _r.dispose();
    _p.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            focusNode: _r,
            controller: _rootController,
            decoration: InputDecoration( //输入框描述
              prefixIcon: Icon(Icons.phone),
              labelText: "账号",
              hintText: "请输入账号"
            ),
            validator: (v){ //只有使用TextFormField才可以用验证，不用验证使用TextField
              if(v==null || v.isEmpty) {
                return "账号不能为空！";
              }
            },
            textInputAction: TextInputAction.next, //回车后跳转
            onFieldSubmitted: (v) { //监听回车键
              print("brath：$v");
            },
          ),
          SizedBox(height: 8,), //设置间隔
          TextFormField(
            focusNode: _p,
            controller: _passController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "密码",
              hintText: "请输入密码",
            ),
            obscureText: true,
            validator: (v) {
              if(v==null || v.length < 5) {
                return "密码不能小于五位数！";
              }
            },
            textInputAction: TextInputAction.send, //将小键盘右下键的回车设置图标
          ),
          SizedBox(height: 16,),
          ElevatedButton(
            onPressed: (){
              print((_key.currentState as FormState).validate().toString());
            },

            child: Text("提交"),
          )
        ],
      ),
    );
  }
}