import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Stream<DocumentSnapshot<Map<String, dynamic>>> tableStream(int number) async* {
  DocumentSnapshot<Map<String, dynamic>> result = await FirebaseFirestore.instance
      .collection('table_id')!
      .doc('table${number}')
      .get();
  yield result;
}