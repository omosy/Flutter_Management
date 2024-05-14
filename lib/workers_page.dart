import 'package:flutter/material.dart';

import 'common_navigationbar.dart';

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("준비중!",
          style: TextStyle(fontSize: 30),),
      ),
      bottomNavigationBar: RouterNavigationBarWidget(),
    );
  }
}
