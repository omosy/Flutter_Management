import 'package:flutter/material.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:joojumflutter/table_to_db.dart';
import 'package:provider/provider.dart';

class TableWidgets extends StatefulWidget {
  //final int selectedTableNum;
  final int tablenum;
  bool isPressed = false;
  TableWidgets({
    super.key,
    //required this.selectedTableNum,
    required this.tablenum,
    required this.isPressed,
  });

  @override
  State<TableWidgets> createState() => _TableWidgetsState();
}

class _TableWidgetsState extends State<TableWidgets> {
  //bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final tableNumProvider = Provider.of<TableNum>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.5),
      child: ElevatedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: widget.isPressed ? Colors.blue : Colors.white,
          elevation: 0.5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5) )
        ),
          onPressed: (){
            tableNumProvider.change(widget.tablenum);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 0),
            child: Column(
              children: [
                Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text("테이블${widget.tablenum}",
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
                Spacer(flex: 1,),
                Flexible(
                  flex: 8,
                  child: Column(
                    children: [
                      Text("빈 테이블",
                      style: TextStyle(color: Colors.black38,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}


//완료 버튼 눌렸을 시!
//테이블 착석 시
//final ref = FirebaseFirestore.instance.collection("cody-preference-game").doc();
//final id = ref.id;
//final enteredAt = DateTime.now();
//String formatDate = DateFormat('yyyy년 MM월 dd일 H시 mm분 ss초').format(createdAt);
// final tableInfo = TableInfo(
//     enteredAt: formatDate,
//     tableNum: tableNum,
//     numberOfPeople: numberOfPeople,
//     yukhoe: yukhoe,
//     jeyuk: jeyuk,
//     sundae: sundae,
//     corncheese: corncheese,
//     nacho: nacho,
//     eomooktang: eomooktang,
//     hwangdo: hwangdo,
// )
// await ref.set(tableInfo.toMap());
