import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:joojumflutter/appbar.dart';
import 'package:joojumflutter/main.dart';
import 'package:joojumflutter/movetheBlue.dart';
import 'package:joojumflutter/streams.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:joojumflutter/table_to_db.dart';
import 'package:joojumflutter/tablewidjet.dart';
import 'package:provider/provider.dart';

List<String> drawerListKor= [
  //'입장료',
  '육회',
  '제육',
  '순대',
  '콘치즈',
  '나초',
  '어묵탕',
  '황도',
  '뚱캔',
  '혈액팩'
];

List<String> drawerListEng= [
  'yukhoe',
  'jeyuk',
  'sundae',
  'corncheese',
  'nacho',
  'eomooktang',
  'hwangdo',
  'juicecan',
  'bloodpack'
];

List<int> priceList=[
  9900,
  10000,
  10000,
  7000,
  5000,
  7000,
  7000,
  3000,
  3000,
];

class TableDrawerScaffold extends StatelessWidget {
  late int numberedTable;
   TableDrawerScaffold({super.key,
   required this.numberedTable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(),
      body: TableDrawerWidget(numberedTable: numberedTable,),
    );
  }
}


class TableDrawerWidget extends StatefulWidget {
  late int numberedTable;

   TableDrawerWidget({
      super.key,
      required this.numberedTable
   });

  @override
  State<TableDrawerWidget> createState() => _TableDrawerWidgetState();
}

class _TableDrawerWidgetState extends State<TableDrawerWidget> {
  Future<int>? _tableNum;
  Stream<DocumentSnapshot<Map<String, dynamic>>>? _fetchedData;
  bool? _orderMode;
  late int _yukhoeval;
  late int _jeyukval;
  late int _sundaeval;
  late int _corncheeseval;
  late int _nachoval;
  late int _eomooktangval;
  late int _hwangdoval;
  late int _moneysumval;
  late int _juicecanval;
  late int _bloodpackval;
  //Stream<DocumentSnapshot<Map<String, dynamic>>>? _streamData;


  @override
  void initState() {
    super.initState();
    _fetchedData = tableStream(widget.numberedTable);
    _orderMode = false;
    _yukhoeval = 0;
    _jeyukval = 0;
    _sundaeval = 0;
    _corncheeseval = 0;
    _nachoval = 0;
    _eomooktangval = 0;
    _hwangdoval = 0;
    _moneysumval = 0;
    _juicecanval = 0;
    _bloodpackval = 0;
  }

  @override
  Widget build(BuildContext context) {
    //final tableNumProvider = Provider.of<TableNum>(context);
    //final tableNumber =tableNumProvider.tableNum;
    //numberedTable = tableNumber;
    //final ref = FirebaseFirestore.instance.collection("table_id").doc("table${tableNumber}");
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Colors.black, width: 1)
        )
      ),
      //color: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
        child: StreamBuilder(
          stream: _fetchedData,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              Map<String,dynamic>? snapshotData = snapshot.data!.data();
              return Row(
                children: [
                  const Spacer(flex: 1,),
                  Flexible(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          child: Text(
                            "${snapshotData!["tableNum"]}번 테이블 (${snapshotData!["numberOfPeople"]}명)",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),),
                        ),
                        const SizedBox(height: 20,),
                      Container(
                        height: 40,
                        child: Row(
                          children: [
                            Text('입장료',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),),
                            Spacer(flex:1),
                            Text('X${snapshotData!["numberOfPeople"]}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(flex:1),
                            Text('${snapshotData!["numberOfPeople"] * 7000}원',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),),
                          ],
                        ),),
                        DrawerBucket(
                            subject: drawerListKor[0],
                            howMany: snapshotData!["${drawerListEng[0]}"],
                            cost: priceList[0]),
                        DrawerBucket(
                            subject: '${drawerListKor[1]}',
                            howMany: snapshotData!["${drawerListEng[1]}"],
                            cost: priceList[1]),
                        DrawerBucket(
                            subject: drawerListKor[2],
                            howMany: snapshotData!["${drawerListEng[2]}"],
                            cost: priceList[2]),
                        DrawerBucket(
                            subject: drawerListKor[3],
                            howMany: snapshotData!["${drawerListEng[3]}"],
                            cost: 7000),
                        DrawerBucket(
                            subject: drawerListKor[4],
                            howMany: snapshotData!["${drawerListEng[4]}"],
                            cost: priceList[4]),
                        DrawerBucket(
                            subject: drawerListKor[5],
                            howMany: snapshotData!["${drawerListEng[5]}"],
                            cost: priceList[5]),
                        DrawerBucket(
                            subject: drawerListKor[6],
                            howMany: snapshotData!["${drawerListEng[6]}"],
                            cost: priceList[6]),
                        DrawerBucket(
                            subject: drawerListKor[7],
                            howMany: snapshotData!["${drawerListEng[7]}"],
                            cost: priceList[7]),
                        DrawerBucket(
                            subject: drawerListKor[8],
                            howMany: snapshotData!["${drawerListEng[8]}"],
                            cost: priceList[8]),
                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              Spacer(flex: 1,),
                              Text('총',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(flex: 1,),
                              Text('${snapshotData!["moneysum"]}원',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1,),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(double.maxFinite, double.maxFinite),
                                      backgroundColor: Colors.black,
                                      elevation: 0,
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        _yukhoeval=snapshotData!["${drawerListEng[0]}"];
                                        _jeyukval=snapshotData!["${drawerListEng[1]}"];
                                        _sundaeval=snapshotData!["${drawerListEng[2]}"];
                                        _corncheeseval=snapshotData!["${drawerListEng[3]}"];
                                        _nachoval=snapshotData!["${drawerListEng[4]}"];
                                        _eomooktangval=snapshotData!["${drawerListEng[5]}"];
                                        _hwangdoval=snapshotData!["${drawerListEng[6]}"];
                                        _juicecanval=snapshotData!["${drawerListEng[7]}"];
                                        _bloodpackval=snapshotData!["${drawerListEng[8]}"];
                                        _moneysumval = snapshotData!["moneysum"];
                                      });
                                      setState(() {
                                        _orderMode = true;
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text("주문하기"),
                                                content: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text("육회: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _yukhoeval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text("$value"),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _yukhoeval = value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("제육: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _jeyukval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text('$value'),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _jeyukval = _jeyukval+value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("순대: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _sundaeval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text("$value"),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _sundaeval += value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("콘치즈: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _corncheeseval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text('$value'),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _corncheeseval += value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("나초: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _nachoval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text("$value"),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _nachoval += value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("어묵탕: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _eomooktangval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text('$value'),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _eomooktangval += value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("황도: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _hwangdoval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text('$value'),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _hwangdoval += value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("뚱캔: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _juicecanval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text('$value'),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _juicecanval += value!;
                                                              });
                                                            }),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text("혈액팩: "),
                                                        DropdownButton(
                                                          //isExpanded: true,
                                                            value: _bloodpackval,
                                                            items: [0,1,2,3,4]
                                                                .map((value) => DropdownMenuItem(
                                                              value: value,
                                                              child: Text('$value'),
                                                            ))
                                                                .toList(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                _bloodpackval += value!;
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
                                                      {
                                                        await FirebaseFirestore.instance
                                                            .collection('table_id')
                                                            .doc("table${snapshotData!["tableNum"]}")
                                                            .update({
                                                          "yukhoe": _yukhoeval,
                                                          "jeyuk": _jeyukval,
                                                          "sundae": _sundaeval,
                                                          "corncheese": _corncheeseval,
                                                          "nacho": _nachoval,
                                                          "eomooktang":_eomooktangval,
                                                          "hwangdo":_hwangdoval,
                                                          "juicecan":_juicecanval,
                                                          "bloodpack":_bloodpackval,
                                                          "moneysum": _moneysumval+(_yukhoeval*priceList[0]
                                                              +_jeyukval*priceList[1]
                                                              +_sundaeval*priceList[2]
                                                              +_corncheeseval*priceList[3]
                                                              +_nachoval*priceList[4]
                                                              +_eomooktangval*priceList[5]
                                                              +_hwangdoval*priceList[6]
                                                              +_juicecanval*priceList[7]
                                                              +_bloodpackval*priceList[8]),
                                                        });
                                                        await FirebaseAnalytics.instance.logEvent(
                                                            name: 'orderedMenu',
                                                            parameters: {'yukhoe': _yukhoeval,
                                                              'jeyuk': _jeyukval,
                                                              'sundae': _sundaeval,
                                                              'corncheese': _corncheeseval,
                                                              'nacho': _nachoval,
                                                              'eomooktang': _eomooktangval,
                                                              'hwangdo': _hwangdoval,
                                                              'juicecan': _juicecanval,
                                                              'bloodpack': _bloodpackval,
                                                            });
                                                        setState(() {
                                                          _fetchedData=tableStream(snapshotData!["tableNum"]);
                                                          //super.initState();
                                                          Navigator.of(context).pop();
                                                        });
                                                      }
                                                      //context.go('/${RoutePath.home.name}');
                                                    },
                                                  ),
                                                ],
                                              );
                                            }
                                        );
                                      });
                                    },
                                    child: Container(
                                      //height: double.maxFinite,
                                      decoration: BoxDecoration(
                                        //color: Colors.black,
                                      ),
                                      child: Text("주문하기",),
                                    )),
                              ),
                              // Flexible(
                              //   flex: 1,
                              //   child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         fixedSize: const Size(double.maxFinite, double.maxFinite),
                              //         backgroundColor: Colors.black,
                              //         elevation: 0,
                              //       ),
                              //       onPressed: (){},
                              //       child: Container(
                              //         // height: double.maxFinite,
                              //         child: Text("이동하기"),
                              //       )),
                              // ),
                              Flexible(
                                flex: 1,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(double.maxFinite, double.maxFinite),
                                      backgroundColor: Colors.black,
                                      elevation: 0,
                                    ),
                                    onPressed: () async{
                                      showDialog(
                                          context: context,
                                          builder: (context){
                                            return AlertDialog(
                                              title: Text("자리비움"),
                                              content: Text("자리를 비우시겠습니까?"),
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
                                                      final tableInfo = TableInfo(
                                                          enteredAt: DateFormat.HOUR24_MINUTE,
                                                          tableNum: snapshotData!["tableNum"],
                                                          numberOfPeople: 0,
                                                          yukhoe: 0,
                                                          jeyuk: 0, sundae: 0,
                                                          corncheese: 0,
                                                          nacho: 0,
                                                          eomooktang: 0,
                                                          hwangdo: 0,
                                                          moneysum: 0,
                                                          juicecan: 0,
                                                          bloodpack: 0,
                                                          sexuallity: "none");
                                                      await FirebaseFirestore.instance
                                                          .collection('table_id')
                                                          .doc("table${snapshotData!["tableNum"]}")
                                                          .update(tableInfo.toMap());
                                                      setState(() {
                                                        tableStream(snapshotData!["tableNum"]);
                                                        Navigator.of(context).pop();
                                                        //context.go('/');
                                                        Navigator.push(context,
                                                            MaterialPageRoute(builder: (context) =>POSHome(title: "joojum")))
                                                            .then((value) {
                                                          setState(() {});
                                                        });
                                                        moveTableNum(context, snapshotData!["tableNum"]);
                                                        //_fetchedData = tableStream(snapshotData!["tableNum"]);
                                                        //tableWidgetFetchedData = tableStream(snapshotData!["tableNum"]);
                                                      });
                                                    }
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Container(
                                      //height: double.maxFinite,
                                      child: Text("자리비움"),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 1,)
                      ],
                    ),
                  ),
                  const Spacer(flex: 1,),
                ],
              );
            }
            else if(snapshot.hasError){
              return Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '에러가 발생했습니다 ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),);
            }
            else {
              return const CircularProgressIndicator();
            }
          }
        ),
      ),
      // decoration: BoxDecoration(
      // ),
    );
  }

  // Stream<DocumentSnapshot<Map<String,dynamic>>> _stream() async*{
  //   var streamResult = await FirebaseFirestore.instance
  //       .collection('table_id')!
  //       .doc('STStU8QQkfzIvAQG0wja')
  //       .get();
  //   yield streamResult;
  // }

  // Future<int> getTableNum() async{
  //   return Provider.of<TableNum>(context).tableNum;
  // }

}

class DrawerBucket extends StatelessWidget {
  final String subject;
  final int howMany;
  final int cost;
  const DrawerBucket({
    super.key,
    required this.subject,
    required this.howMany,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text('$subject',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),
          ),
          //Spacer(flex: 1,),
          Text('X$howMany',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          //Spacer(flex: 1,),
          Text('${howMany * cost}원',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),),
        ],
      ),
    );
  }
}
