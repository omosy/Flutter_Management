import 'package:flutter/material.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:provider/provider.dart';

Future<void> moveTableNum(
    BuildContext context, int nextTableNum) async {
  final int currntTableNum = context.read<TableNum>().tableNum;
  context.read<TableNum>().change(nextTableNum);
}