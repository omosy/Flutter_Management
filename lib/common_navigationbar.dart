import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterNavigationBarWidget extends StatelessWidget {
  final bool? darkmode;
  const RouterNavigationBarWidget({
    Key? key,
    this.darkmode,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.05 * MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.1,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () => context.go('/'),
              icon: const Icon(
                Icons.table_bar,
                //color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () => context.go('/Workers'),
              icon: const Icon(Icons.person),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () => context.go('/Statistics'),
              icon: const Icon(Icons.monetization_on),
            ),
          ),
        ],
      ),
    );
  }
}
