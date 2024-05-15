
import 'package:flutter/material.dart';
import 'package:joojumflutter/common_navigationbar.dart';
import 'package:joojumflutter/table_drawer.dart';
import 'package:joojumflutter/table_provider.dart';
import 'package:joojumflutter/tablewidjet.dart';
import 'package:provider/provider.dart';



void main() {
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
                              isPressed: false,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 2,
                            isPressed: false,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 3,
                            isPressed: false,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 4,
                            isPressed: false,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 5,
                            isPressed: false,
                            ),
                        ),
                        Flexible(
                          flex: 2,
                          child:
                          TableWidgets(
                            tablenum: 13,
                            isPressed: false,
                            ),
                        ),
                        Spacer(flex: 1,),
                      ],
                    ),
                  ),
                  // Flexible(
                  //   flex: 2,
                  //   child: Row(
                  //     children: [
                  //       Spacer(flex: 1,),
                  //       Flexible(
                  //         flex: 1,
                  //         child:
                  //         TableWidgets(
                  //           tablenum: 15,
                  //           isPressed: false,
                  //           selectedTableNum: context.watch()<TableNum>().tableNum,
                  //         ),
                  //       ),
                  //       Spacer(flex: 1,),
                  //     ],
                  //   ),
                  // ),
                  // Flexible(
                  //   flex: 2,
                  //   child: Row(
                  //     children: [
                  //       Spacer(flex: 1,),
                  //       Flexible(
                  //         flex: 1,
                  //         child:
                  //         TableWidgets(
                  //           tablenum: 14,
                  //           isPressed: false,
                  //           selectedTableNum: context.watch()<TableNum>().tableNum,
                  //         ),
                  //       ),
                  //       Spacer(flex: 1,),
                  //     ],
                  //   ),
                  // ),
                  // Flexible(
                  //   flex: 2,
                  //   child: Row(
                  //     children: [
                  //       Spacer(flex: 1,),
                  //       Flexible(
                  //         flex: 1,
                  //         child:
                  //         TableWidgets(
                  //           tablenum: 10,
                  //           isPressed: false,
                  //           selectedTableNum: context.watch()<TableNum>().tableNum,
                  //         ),
                  //       ),
                  //       Spacer(flex: 1,),
                  //     ],
                  //   ),
                  // ),
                  // Flexible(
                  //   flex: 2,
                  //   child: Row(
                  //     children: [
                  //       Spacer(flex: 1,),
                  //       Flexible(
                  //         flex: 1,
                  //         child:
                  //         TableWidgets(
                  //           tablenum: 11,
                  //           isPressed: false,
                  //           selectedTableNum: context.watch()<TableNum>().tableNum,
                  //         ),
                  //       ),
                  //       Spacer(flex: 1,),
                  //     ],
                  //   ),
                  // ),
                  //Spacer(flex: 1,),
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
