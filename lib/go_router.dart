import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joojumflutter/main.dart';
import 'package:joojumflutter/stats_page.dart';
import 'package:joojumflutter/streams.dart';
import 'package:joojumflutter/table_drawer.dart';
import 'package:joojumflutter/table_to_db.dart';
import 'package:joojumflutter/workers_page.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // for(int i = 1; i<40; i++) {
  //   final ref = FirebaseFirestore.instance.collection("table_id").doc(
  //       'table$i');
    //final createdAt = DateTime.now();
    //String formatDate = DateFormat('yyyy년 MM월 dd일 H시 mm분 ss초').format(createdAt);
    //   final tableInfo = TableInfo(
    //       enteredAt: DateTime.now(),
    //       tableNum: i,
    //       numberOfPeople: 0,
    //       yukhoe: 0,
    //       jeyuk: 0,
    //       sundae: 0,
    //       corncheese: 0,
    //       nacho: 0,
    //       eomooktang: 0,
    //       hwangdo: 0,
    //       moneysum: 0,
    //       sexuallity: 'null',
    //   );
    //   await ref.set(tableInfo.toMap());
    // }// (초깃값 설정)
  for(int i = 1;i<40;i++){
    tableStream(i);}
  runApp(const RouterApp());
}
late int num_table;

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: POSHome(title: 'AE MANAGEMENT SYS.'),
    ),
      routes: [
        GoRoute(
        path: 'Drawer',
        pageBuilder: (context, state)
        { final map = Uri.parse(state.uri.toString()).queryParameters;
          return NoTransitionPage(
            child: TableDrawerScaffold(
                      numberedTable: int.parse(map["id"]!),
                    ));
                  }),]
    ),
    GoRoute(
      path: '/Workers',
      pageBuilder: (context, state) => const NoTransitionPage(
        //key: state.pageKey,
          child: WorkersScreen(),
    ),
    ),
    GoRoute(
      path: '/Statistics',
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: StatisticsScreen()),
    ),],
);

class RouterApp extends StatelessWidget {
  const RouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //routeInformationParser: _router.routeInformationParser,
      //routeInformationProvider: _router.routeInformationProvider,
      //routerDelegate: _router.routerDelegate,
      routerConfig: _router,
      title: 'Router dummy',
    );
  }
}
