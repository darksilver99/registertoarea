import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future initCustomer(BuildContext context) async {
  CustomerListRecord? customerResult;

  customerResult = await queryCustomerListRecordOnce(
    queryBuilder: (customerListRecord) => customerListRecord.where(
      'create_by',
      isEqualTo: currentUserReference,
    ),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  FFAppState().customerData = CustomerDataStruct(
    customerName: customerResult?.customerName,
    expireDate: customerResult?.expireDate,
    customerId: customerResult?.reference.id,
    customerRef: customerResult?.reference,
  );
}
