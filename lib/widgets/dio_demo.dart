import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DioDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DioDemoState();
  }
}

class _DioDemoState extends State<DioDemo> {
  Dio _dio = Dio();

  void _get() async {
    var res = await _dio.get(
      "https://www.baidu.com",
      queryParameters: {
        "wq": "123"
      }
    );
    
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("网络请求演示"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: _get,
              child: Text("getUserinfo"),
            ),
          )
        ],
      )
    );
  }
}