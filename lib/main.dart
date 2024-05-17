
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:joojumflutter/common_navigationbar.dart';
import 'package:joojumflutter/firebase_options.dart';
import 'package:joojumflutter/table_drawer.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:joojumflutter/tablewidjet.dart';
import 'package:provider/provider.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=>TableNum()),
    ],
    child: MaterialApp.router(
      title: 'flt',
    ));
  }
}

class POSHome extends StatefulWidget {

  const POSHome({super.key, required this.title});


  final String title;
  

  @override
  State<POSHome> createState() => _POSHomeState();
}

class _POSHomeState extends State<POSHome> {
  Stream<DocumentSnapshot<Map<String, dynamic>>>? _fetchedData;
  
  void onPressedLogic(int tableNum){
    if (_selectedTableNum != tableNum){
      setState(() {
        _selectedTableNum = tableNum;
      });
    }
    else {
      null;
    }
  }


  bool isPressedLogic(int tableNum){
    if (_selectedTableNum == tableNum){
      return true;
    }
    else {
      return false;
    }
  }

  int _selectedTableNum = 0;

  @override
  void initState() {
    super.initState();
    _fetchedData = _stream();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableNum>(
      create: (_)=>TableNum(),
      child: StreamBuilder(
        stream: _fetchedData,
        builder: (context, snapshot) {
          Map<String,dynamic>? snapshotData = snapshot.data!.data();
          if(snapshot.hasData){
              return Scaffold(
                body: Row(
                  children: [
                    Flexible(
                      flex: 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Spacer(flex: 1,),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 1,
                                    isPressed: false,
                                    number: 1,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 2,
                                    isPressed: false,
                                    number: 2,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 3,
                                    isPressed: false,
                                    number: 3,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 4,
                                    isPressed: false,
                                    number: 4,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 5,
                                    isPressed: false,
                                    number: 5,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 6,
                                    isPressed: false,
                                    number: 6,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 7,
                                    isPressed: false,
                                    number: 7,
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 8,
                                    isPressed: false,
                                    number: 8,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 9,
                                    isPressed: false,
                                    number: 9,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 10,
                                    isPressed: false,
                                    number: 10,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 11,
                                    isPressed: false,
                                    number: 11,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 12,
                                    isPressed: false,
                                    number: 12,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 13,
                                    isPressed: false,
                                    number: 13,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 14,
                                    isPressed: false,
                                    number: 14,
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 15,
                                    isPressed: false,
                                    number: 15,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 16,
                                    isPressed: false,
                                    number: 16,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 17,
                                    isPressed: false,
                                    number: 17,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 18,
                                    isPressed: false,
                                    number: 18,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 19,
                                    isPressed: false,
                                    number: 19,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 20,
                                    isPressed: false,
                                    number: 20,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 21,
                                    isPressed: false,
                                    number: 21,
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 22,
                                    isPressed: false,
                                    number: 22,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 23,
                                    isPressed: false,
                                    number: 23,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 24,
                                    isPressed: false,
                                    number: 24,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 25,
                                    isPressed: false,
                                    number: 25,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 26,
                                    isPressed: false,
                                    number: 26,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 27,
                                    isPressed: false,
                                    number: 27,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 28,
                                    isPressed: false,
                                    number: 28,
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Row(
                              children: [
                                Spacer(
                                  flex: 1,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 29,
                                    isPressed: false,
                                    number: 29,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 30,
                                    isPressed: false,
                                    number: 30,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 31,
                                    isPressed: false,
                                    number: 31,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 32,
                                    isPressed: false,
                                    number: 32,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 33,
                                    isPressed: false,
                                    number: 33,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 34,
                                    isPressed: false,
                                    number: 34,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TableWidgets(
                                    tablenum: 35,
                                    isPressed: false,
                                    number: 35,
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          // Spacer(flex: 1,),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: TableDrawerWidget(numberedTable: snapshotData!["nowtable"],),
                    )
                  ],
                ),
                bottomNavigationBar: RouterNavigationBarWidget(),
              );
            }
          else if(snapshot.hasError){
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '에러가 발생했습니다 ${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),),
            );
          }
          else {
            return const CircularProgressIndicator();
          }
          }
      ),
    );
  }
  Stream<DocumentSnapshot<Map<String, dynamic>>> _stream() async* {
    DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance
        .collection('table_id')!
        .doc('NowTable')
        .get();
    yield result;
  }
}
