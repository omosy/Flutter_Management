import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:joojumflutter/enums.dart';
import 'package:joojumflutter/streams.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:joojumflutter/table_to_db.dart';
import 'package:provider/provider.dart';

List<String> sexualList =["남자", "여자", "none", "합석"];
List<int> nopList = [0,1,2,3,4,5,6,7];

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
   String sexualvalue = sexualList[2];
  int nopvalue = nopList[0];
  Stream<DocumentSnapshot<Map<String, dynamic>>>? _tableWidgetFetchedData;
  //bool isPressed = false;


  @override
  void initState() {
    super.initState();
    //nopvalue = nopList[0];
    //sexualvalue = sexualList[2];
    _tableWidgetFetchedData = tableStream(widget.tablenum);
  }

  @override
  Widget build(BuildContext context) {
    final tableNumProvider = Provider.of<TableNum>(context);
    return StreamBuilder(
      stream: _tableWidgetFetchedData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          final ref = snapshot.data!.data();
          //final Timestamp timeStamped = ref!["enteredAt"];
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
                    setState(() {
                      showDialog(
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
                                          //isExpanded: true,
                                          value: sexualvalue,
                                          items: sexualList
                                              .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text(value),
                                          ))
                                              .toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              sexualvalue = value!;
                                            });
                                          }),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("인원수: "),
                                      DropdownButton(
                                          //isExpanded: true,
                                          value: nopvalue,
                                          items: nopList
                                              .map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text('$value'),
                                          ))
                                              .toList(),
                                          onChanged: (valuev) {
                                            setState(() {
                                              nopvalue = valuev!;
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
                                    final DateTime nowdate = DateTime.now();
                                    if (nopvalue != null &&
                                        sexualvalue != null) {
                                      await FirebaseFirestore.instance
                                          .collection('table_id')
                                          .doc("table${widget.tablenum}")
                                          .update({
                                        "moneysum" : (sexualvalue==sexualList[3]) ?(0) :(nopvalue*7000),
                                        "sexuallity": sexualvalue,
                                        "numberOfPeople": nopvalue,
                                        "isUsing": true,
                                        "enteredAt":DateFormat("H시 m분").format(DateTime.now()).toString(),
                                      });
                                      await FirebaseAnalytics.instance.logEvent(
                                          name: 'numberOfPeople',
                                          parameters: {'numberOfPeople': nopvalue,
                                            'numberOfMale': sexualvalue==sexualList[0] ?nopvalue : 0,
                                            'numberOfFemale': sexualvalue==sexualList[1] ?nopvalue : 0,
                                            'numberOfTogether': sexualvalue==sexualList[3] ?nopvalue : 0
                                                      });
                                      setState(() {
                                        _tableWidgetFetchedData=tableStream(widget.tablenum);
                                        //super.initState();
                                      });
                                      Navigator.of(context).pop();
                                    }
                                    //context.go('/${RoutePath.home.name}');
                                  },
                                ),
                              ],
                            );
                          });
                    });
                  }
                  else if(ref!["isUsing"]==true){
                    context.push("/Drawer?id=${tableNumProvider.tableNum}");
                  }
                  setState(() {
                    tableStream(widget.tablenum);
                  });
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
                                  fontSize: 12,
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
                              //final DateTime enteredAt = DateTime.fromMicrosecondsSinceEpoch(timeStamped.microsecondsSinceEpoch);
                              //String enteredhhmm =
                              //DateFormat('HH시 MM분').format(enteredAt);
                              return Column(
                                children: [
                                  Text(
                                    "입장: ${ref!["enteredAt"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 9),
                                  ),
                                  Text(
                                    "인원수: ${ref!["numberOfPeople"]}명",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 9),
                                  ),
                                  Text(
                                    "성별: ${ref!["sexuallity"]}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 9),
                                  ),
                                ],
                              );
                            } else {
                              return const Text(
                                "빈 테이블",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 9,
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
