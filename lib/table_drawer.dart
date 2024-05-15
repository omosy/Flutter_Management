import 'package:flutter/material.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:provider/provider.dart';

class TableDrawerWidget extends StatelessWidget {
  const TableDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tableNumProvider = Provider.of<TableNum>(context);
    return Container(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Text(
                    "${tableNumProvider.tableNum}번 테이블",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
            ),
            Spacer(
              flex: 9,
            )
          ],
        ),
      ),
      color: Colors.white,
      // decoration: BoxDecoration(
      // ),
    );
  }
}
