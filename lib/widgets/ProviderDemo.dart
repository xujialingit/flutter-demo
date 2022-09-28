import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/counter_provider.dart';

class ProviderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProviderDemoState();
  }
}

class _ProviderDemoState extends State<ProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Provider全局状态管理"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed("ProviderDemo2");
          }, child: Icon(Icons.add_task_rounded)),
          Text(
            Provider.of<CounterProvider>(context).count.toString()
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.sanitizer_sharp),
        onPressed: (){
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}

class ProviderDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Provider2"),
      ),
      body: FloatingActionButton(
        child: Icon(Icons.sanitizer_sharp),
        onPressed: (){
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}

