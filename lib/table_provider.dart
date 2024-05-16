import 'package:flutter/material.dart';

class TableNum with ChangeNotifier{
  int _initNum = 1;
  int get tableNum => _initNum;

  void change(int tableNum){
    _initNum = tableNum;
    notifyListeners();
  }
}