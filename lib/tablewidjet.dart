import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:joojumflutter/enums.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:joojumflutter/table_to_db.dart';
import 'package:provider/provider.dart';


class TableWidgets extends StatefulWidget {
  //final int selectedTableNum;
  late int number;
  final int tablenum;
  bool isPressed = false;
  TableWidgets({
    super.key,
    //required this.selectedTableNum,
    required this.number,
    required this.tablenum,
    required this.isPressed,
  });

  @override
  State<TableWidgets> createState() => _TableWidgetsState();
}

class _TableWidgetsState extends State<TableWidgets> {
  //bool isPressed = false;
  late String? _sexualvalue;
  late int? _nopvalue;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? _fetchedData;


  @override
  void initState() {
    super.initState();
    _nopvalue = null;
    _sexualvalue = null;
    _fetchedData = _stream();
  }

  @override
  Widget build(BuildContext context) {
    final tableNumProvider = Provider.of<TableNum>(context);
    return StreamBuilder(
      stream: _fetchedData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final ref = snapshot.data!.data();
          DateTime _enteredAt =
          ref!["enteredAt"].toDate();
          String enteredhhmm =
          DateFormat('HH시 MM분').format(_enteredAt);
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 1.5),
              child: ElevatedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor:
                        tableNumProvider.tableNum == widget.tablenum
                            ? Colors.blue
                            : Colors.white,
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () async {
                  tableNumProvider.change(widget.tablenum);
                  await FirebaseFirestore.instance
                      .collection('table_id')
                      .doc("NowTable")
                      .set({"nowtable": tableNumProvider.tableNum});
                  if(ref!["isUsing"]!=true){
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("새 테이블"),
                            content: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("성별: "),
                                    DropdownButton(
                                        value: _sexualvalue,
                                        items: ["남자", "여자", "none"]
                                            .map((value) => DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                ))
                                            .toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _sexualvalue = newValue.toString();
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("인원수: "),
                                    DropdownButton(
                                        value: _nopvalue,
                                        items: [1,2,3,4,5,6,7]
                                            .map((value) => DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value.toString()),
                                                ))
                                            .toList(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            _nopvalue = int.parse(newValue.toString());
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  '취소',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  '확인',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () async {
                                  if (_nopvalue != null &&
                                      _sexualvalue != null) {
                                    await FirebaseFirestore.instance
                                        .collection('table_id')
                                        .doc("table${widget.tablenum}")
                                        .update({
                                      "sexuallity": _sexualvalue,
                                      "numberOfPeople": _nopvalue,
                                      "isUsing": true,
                                      "enteredAt": Timestamp.fromDate(DateTime.now()),
                                    });
                                    Navigator.of(context).pop();
                                  }
                                  //context.go('/${RoutePath.home.name}');
                                },
                              ),
                            ],
                          );
                        });
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                  child: Column(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                "테이블${widget.tablenum}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Flexible(
                        flex: 8,
                        child: Builder(
                          builder: (context) {
                            if (ref!["isUsing"] == true) {
                              return Column(
                                children: [
                                  Text(
                                    "입장: ${enteredhhmm}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "인원수: ${ref!["numberOfPeople"]}명",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Text(
                                    "성별: ${ref!["sexuallity"]}",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              );
                            } else {
                              return Text(
                                "빈 테이블",
                                style: TextStyle(
                                  color: Colors.black38,
                                ),
                              );
                            }
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        else if (snapshot.hasError) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              '에러가 발생했습니다 ${snapshot.error}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
        }
    );
  }
  Stream<DocumentSnapshot<Map<String, dynamic>>> _stream() async* {
    DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance
        .collection('table_id')!
        .doc('table${widget.number}')
        .get();
    yield result;
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
