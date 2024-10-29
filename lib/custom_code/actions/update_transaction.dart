// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:register_to_area/custom_toon/custom_toon.dart';

Future<int> updateTransaction(VisitorRecord visitorDoc) async {
  // Add your function code here!
  final rs = await FirebaseFirestore.instance
      .collection(
          "${FFAppState().customerData.customerRef!.path}/transaction_list")
      .where("status", isEqualTo: 0)
      .where("visitor_ref", isEqualTo: visitorDoc.reference)
      .get();
  if (rs.size != 0) {
    // แสดงว่ามีเข้าค้างอยู่ให้ เปลี่ยนสถานะเป็น 1 คือ การสแกนออก
    rs.docs[0].reference.update({
      "status": 1,
      "date_out": getCurrentTimestamp,
      "duration": millisecondsBetween(
          rs.docs[0].data()["date_in"].toDate(), getCurrentTimestamp)
    });
    return 1; // สแกนออก
  } else {
    FirebaseFirestore.instance
        .collection(
            "${FFAppState().customerData.customerRef!.path}/transaction_list")
        .doc()
        .set({
      "status": 0,
      "date_in": getCurrentTimestamp,
      "card_no": visitorDoc.cardNo,
      "full_name": visitorDoc.fullName,
      "company": visitorDoc.company,
    });
    return 0; // สแกนเข้า
  }
}
