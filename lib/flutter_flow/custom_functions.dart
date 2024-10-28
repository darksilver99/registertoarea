import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? dateTimeTh(DateTime? date) {
  if (date == null) {
    return null;
  }

  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String? dateTh(DateTime? date) {
  if (date == null) {
    return null;
  }
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String getNextNo(VisitorRecord? lastVisitor) {
  if (lastVisitor == null) {
    return "000001"; // Return "000001" if lastVisitor is null
  } else {
    // Assuming 'no' is a string and should be converted to an int
    int lastNo = int.parse(lastVisitor.no); // Convert 'no' to an integer
    int nextNo = lastNo + 1; // Increment by 1
    return nextNo
        .toString()
        .padLeft(6, '0'); // Convert back to string and pad with zeros
  }
}

List<String> removeNotContainerInList(
  List<String> list1,
  List<String> list2,
) {
  return list2.where((element) => list1.contains(element)).toList();
}

bool areListsEqual(
  List<String> list1,
  List<String> list2,
) {
  if (list1.length != list2.length) {
    return false; // Different lengths, so they cannot be the same
  }

  // Sort both lists
  List<String> sortedList1 = List.from(list1)..sort();
  List<String> sortedList2 = List.from(list2)..sort();

  // Check if each element in both sorted lists is the same
  for (int i = 0; i < sortedList1.length; i++) {
    if (sortedList1[i] != sortedList2[i]) {
      return false;
    }
  }

  return true;
}
