import 'package:flutter/material.dart';

class TableNum with ChangeNotifier{
  int _initNum = 0;
  int get tableNum => _initNum;

  void change(int tableNum){
    _initNum = tableNum;
    notifyListeners();
  }
}