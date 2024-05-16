import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:provider/provider.dart';

class TableDrawerWidget extends StatefulWidget {
  //late int tableNumbering;

   TableDrawerWidget({
      super.key,
      //required this.tableNumbering
   });

  @override
  State<TableDrawerWidget> createState() => _TableDrawerWidgetState();
}

class _TableDrawerWidgetState extends State<TableDrawerWidget> {
  Future<DocumentSnapshot<Map<String, dynamic>>>? _fetchedData;
  //Stream<DocumentSnapshot<Map<String, dynamic>>>? _streamData;

  @override
  void initState() {
    super.initState();
    _fetchedData = _future();
    //_streamData = _stream();
    // if (whichBalanceUri.isNotEmpty) {
    //   whichBalanceUri.clear();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final tableNumProvider = Provider.of<TableNum>(context);
    final tableNumber = tableNumProvider.tableNum;
    //final ref = FirebaseFirestore.instance.collection("table_id").doc("table${tableNumber}");
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Flexible(
                flex: 1,
                child: Text(
                    "${tableNumber}번 테이블",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
            ),
            Flexible(
              flex: 9,
              child: FutureBuilder(
                  future: _fetchedData,
                  builder: (context, snapshot){
                    if (snapshot.hasData){
                      Map<String,dynamic>? snapshotData = snapshot.data!.data();
                      return Column(
                        children: [
                          Text((snapshotData?['cornscheese']!=null) ? (snapshotData?['corncheese']) : "null!")
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
                  }),
            )
          ],
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

  Future<DocumentSnapshot<Map<String, dynamic>>> _future() async {
    DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance
        .collection('table_id')!
        .doc('table1')
        .get();
    return result;
  }
}
