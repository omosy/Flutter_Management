import 'package:flutter/material.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:provider/provider.dart';

class TableDrawerWidget extends StatelessWidget {
  const TableDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tableNumProvider = Provider.of<TableNum>(context);
    return Container(
      child: Text("${tableNumProvider.tableNum}"),
      color: Colors.white,
      // decoration: BoxDecoration(
      // ),
    );
  }
}
