import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joojumflutter/appbar.dart';
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
];

List<String> drawerListEng= [
  'yukhoe',
  'jeyuk',
  'sundae',
  'corncheese',
  'nacho',
  'eomooktang',
  'hwangdo',
];

List<int> priceList=[
  9900,
  10000,
  10000,
  7000,
  5000,
  7000,
  7000,
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
  //Stream<DocumentSnapshot<Map<String, dynamic>>>? _streamData;

  @override
  void initState() {
    super.initState();
    _fetchedData = tableStream(widget.numberedTable);
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
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      "${snapshotData!["tableNum"]}번 테이블 (${snapshotData!["numberOfPeople"]}명)",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
                  ),
                  Spacer(flex: 1,),
                  Flexible(
                    flex: 15,
                    child: Builder(builder: (context){
                      if(snapshotData!["isUsing"]==true){
                        return Column(
                          children: [Container(
                            height: 50,
                            child: Row(
                              children: [
                                Text('입장료',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                Spacer(flex: 1,),
                                Text('X${snapshotData!["numberOfPeople"]}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(flex: 1,),
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
                                cost: snapshotData!["${drawerListEng[0]}"]*priceList[0]),
                            DrawerBucket(
                                subject: '${drawerListKor[1]}',
                                howMany: snapshotData!["${drawerListEng[1]}"],
                                cost: snapshotData!["${drawerListEng[1]}"]*priceList[1]),
                            DrawerBucket(
                                subject: drawerListKor[2],
                                howMany: snapshotData!["${drawerListEng[2]}"],
                                cost: snapshotData!["${drawerListEng[2]}"]*priceList[2]),
                            DrawerBucket(
                                subject: drawerListKor[3],
                                howMany: snapshotData!["${drawerListEng[3]}"],
                                cost: snapshotData!["${drawerListEng[3]}"]*priceList[3]),
                            DrawerBucket(
                                subject: drawerListKor[4],
                                howMany: snapshotData!["${drawerListEng[4]}"],
                                cost: snapshotData!["${drawerListEng[4]}"]*priceList[4]),
                            DrawerBucket(
                                subject: drawerListKor[5],
                                howMany: snapshotData!["${drawerListEng[5]}"],
                                cost: snapshotData!["${drawerListEng[5]}"]*priceList[5]),
                            DrawerBucket(
                                subject: drawerListKor[6],
                                howMany: snapshotData!["${drawerListEng[6]}"],
                                cost: snapshotData!["${drawerListEng[6]}"]*priceList[6]),
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
                            Spacer(flex: 1,),
                            Flexible(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          elevation: 0,
                                        ),
                                        onPressed: (){},
                                        child: Container(
                                          //height: double.maxFinite,
                                          decoration: BoxDecoration(
                                            //color: Colors.black,
                                          ),
                                          child: Text("주문하기",),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          elevation: 0,
                                        ),
                                        onPressed: (){},
                                        child: Container(
                                          // height: double.maxFinite,
                                          child: Text("이동하기"),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
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
                                                              enteredAt: Timestamp.fromDate(DateTime.now()),
                                                              tableNum: snapshotData!["tableNum"],
                                                              numberOfPeople: 0,
                                                              yukhoe: 0,
                                                              jeyuk: 0, sundae: 0,
                                                              corncheese: 0,
                                                              nacho: 0,
                                                              eomooktang: 0,
                                                              hwangdo: 0,
                                                              moneysum: 0,
                                                              sexuallity: "none");
                                                          await FirebaseFirestore.instance
                                                              .collection('table_id')
                                                              .doc("table${snapshotData!["tableNum"]}")
                                                              .update(tableInfo.toMap());
                                                          Navigator.of(context).pop();
                                                          //context.go('/');
                                                          setState(() {
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
                                  ],
                                ))],
                        );
                      }
                      else{
                        return Flexible(
                            flex: 8,
                            child: Text("빈 테이블"));
                      }
                    }),
                  )
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
