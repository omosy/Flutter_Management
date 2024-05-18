import 'package:flutter/material.dart';

class CommonAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final bool? darkmode;

  const CommonAppBarWidget({super.key, this.darkmode});

  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Divider(height: 0, thickness: 0.07, color: Colors.grey),
      ),
      backgroundColor: darkmode == true ? Colors.black : Colors.white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: darkmode == true ? Colors.white : Colors.black,
          size: 35,
        ),
      ),
      leadingWidth: 50,
    );
  }
}
