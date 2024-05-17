
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableNum>(
      create: (_)=>TableNum(),
      child: Scaffold(
        // appBar: AppBar(
        //   // TRY THIS: Try changing the color here to a specific color (to
        //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        //   // change color while the other colors stay the same.
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
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
                        Spacer(flex: 1,),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 1,
                            isPressed: false, number: 1,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 2,
                            isPressed: false, number: 2,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 3,
                            isPressed: false, number: 3,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 4,
                            isPressed: false, number: 4,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 5,
                            isPressed: false, number: 5,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 6,
                            isPressed: false, number: 6,
                          ),
                        ),
                        Spacer(flex: 1,),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Spacer(flex: 1,),
                        Flexible(
                          flex: 2,
                          child:
                            TableWidgets(
                              tablenum: 7,
                              isPressed: false, number: 7,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 8,
                            isPressed: false, number: 8,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 9,
                            isPressed: false, number: 9,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 10,
                            isPressed: false, number: 10,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 11,
                            isPressed: false, number: 11,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 12,
                            isPressed: false, number: 12,
                            ),
                        ),
                        Spacer(flex: 1,),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Spacer(flex: 1,),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 13,
                            isPressed: false, number: 13,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 14,
                            isPressed: false, number: 14,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 15,
                            isPressed: false, number: 15,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 16,
                            isPressed: false, number: 16,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 17,
                            isPressed: false, number: 17,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 18,
                            isPressed: false, number: 18,
                          ),
                        ),
                        Spacer(flex: 1,),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Spacer(flex: 1,),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 19,
                            isPressed: false, number: 19,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 20,
                            isPressed: false, number: 20,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 21,
                            isPressed: false, number: 21,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 22,
                            isPressed: false, number: 22,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 23,
                            isPressed: false, number: 23,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 24,
                            isPressed: false, number: 24,
                          ),
                        ),
                        Spacer(flex: 1,),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        Spacer(flex: 1,),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 25,
                            isPressed: false, number: 25,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 26,
                            isPressed: false, number: 26,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 27,
                            isPressed: false, number: 27,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 28,
                            isPressed: false, number: 28,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 29,
                            isPressed: false, number: 29,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 30,
                            isPressed: false, number: 30,
                          ),
                        ),
                        Spacer(flex: 1,),
                      ],
                    ),
                  ),
                 // Spacer(flex: 1,),
                ],
              ),
            ),
            Flexible(
              flex: 2,
                child: TableDrawerWidget(),
            )
          ],
        ),
        bottomNavigationBar: RouterNavigationBarWidget(),
      ),
    );
  }
}
