import 'package:flutter/material.dart';

class TableNumDrawer with ChangeNotifier{
  int _initNum = 1;
  int get tableNumDrawer => _initNum;

  void change(int tableNum){
    _initNum = tableNum;
    notifyListeners();
  }
}