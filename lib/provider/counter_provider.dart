import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}