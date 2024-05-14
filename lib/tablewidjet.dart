import 'package:flutter/material.dart';

class TableWidgets extends StatelessWidget {
  final int tablenum;
  const TableWidgets({
    super.key,
    required this.tablenum,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0.5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5) )
        ),
          onPressed: (){},
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text("테이블$tablenum",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                           fontWeight: FontWeight.w600,
                        ),),
                      ),
                      Spacer(flex: 1,),
                    ],
                  ),
              ),
              Flexible(
                flex: 8,
                child: Column(
                  children: [
                    Text("data2"),
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }
}
