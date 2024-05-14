import 'package:flutter/material.dart';
import 'package:joojumflutter/common_navigationbar.dart';
import 'package:joojumflutter/tablewidjet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: const POSHome(title: 'AE MANAGEMENT SYS.'),
    );
  }
}

class POSHome extends StatefulWidget {
  const POSHome({super.key, required this.title});


  final String title;

  @override
  State<POSHome> createState() => _POSHomeState();
}

class _POSHomeState extends State<POSHome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
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
                    TableWidgets(tablenum: 1,),
                ),
                Flexible(
                  flex: 2,
                  child:
                  TableWidgets(tablenum: 2,),
                ),
                Flexible(
                  flex: 2,
                  child:
                  TableWidgets(tablenum: 3,),
                ),
                Flexible(
                  flex: 2,
                  child:
                  TableWidgets(tablenum: 4,),
                ),
                Flexible(
                  flex: 2,
                  child:
                  TableWidgets(tablenum: 5,),
                ),
                Flexible(
                  flex: 2,
                  child:
                  TableWidgets(tablenum: 6,),
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
                  flex: 1,
                  child:
                  TableWidgets(tablenum: 2,),
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
                  flex: 1,
                  child:
                  TableWidgets(tablenum: 3,),
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
                  flex: 1,
                  child:
                  TableWidgets(tablenum: 4,),
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
                  flex: 1,
                  child:
                  TableWidgets(tablenum: 5,),
                ),
                Spacer(flex: 1,),
              ],
            ),
          ),
          //Spacer(flex: 1,),
        ],
      ),
      bottomNavigationBar: RouterNavigationBarWidget(),
    );
  }
}
