import 'package:flutter/material.dart';

import 'common_navigationbar.dart';

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: RouterNavigationBarWidget(),
    );
  }
}
