import 'package:flutter/material.dart';

import 'common_navigationbar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("준비중!",
        style: TextStyle(fontSize: 30),),
      ),
      bottomNavigationBar: RouterNavigationBarWidget(),
    );
  }
}