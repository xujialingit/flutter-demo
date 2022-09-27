import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //GestireDetector 并不具有显示效果，而是检测由用户做出的手势
    return GestureDetector(
      onTap: (){
        print("MyButton was tapped!");
      },
      child: Container(
        height: 40.0,
        width: 100.0,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child:const Center(
          child: Text(
            "Engage",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}