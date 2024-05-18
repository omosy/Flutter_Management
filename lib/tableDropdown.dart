// import 'package:flutter/material.dart';
//
// class TableDropdown extends StatefulWidget {
//   final dynamic value;
//   final List<dynamic> list;
//   const TableDropdown({super.key,
//   required this.value,
//   required this.list,});
//
//   @override
//   State<TableDropdown> createState() => _TableDropdownState();
// }
//
// class _TableDropdownState extends State<TableDropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       //isExpanded: true,
//         value: widget.value,
//         items: widget.list
//             .map((value) => DropdownMenuItem(
//           value: value,
//           child: Text(value),
//         ))
//             .toList(),
//         onChanged: (value) {
//           setState(() {
//             sexualvalue = value;
//           });
//         });
//   }
// }
