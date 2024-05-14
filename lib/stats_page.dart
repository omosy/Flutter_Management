import 'package:flutter/material.dart';

import 'common_navigationbar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RouterNavigationBarWidget(),
    );
  }
}