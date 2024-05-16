import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:joojumflutter/main.dart';
import 'package:joojumflutter/stats_page.dart';
import 'package:joojumflutter/workers_page.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const RouterApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) =>
      const NoTransitionPage(child: POSHome(title: 'AE MANAGEMENT SYS.'),
      // routes: [
      //   GoRoute(
      //     path: 'SelectTheme',
      //     pageBuilder: (context, state) =>
      //     const NoTransitionPage(child: ThemeSelectScreen()),
      //   )
      // ],
    ),),
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
