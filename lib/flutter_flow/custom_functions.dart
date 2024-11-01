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
    int lastNo = int.parse(lastVisitor.cardNo); // Convert 'no' to an integer
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

String formatDuration(int milliseconds) {
  // Convert milliseconds to total seconds
  int totalSeconds = milliseconds ~/ 1000;

  // Calculate days, hours, minutes, and seconds
  int days = totalSeconds ~/ (24 * 3600);
  int hours = (totalSeconds % (24 * 3600)) ~/ 3600;
  int minutes = (totalSeconds % 3600) ~/ 60;
  int seconds = totalSeconds % 60;

  // Create the formatted string
  String formatted = '';

  if (days > 0) {
    formatted += '$days วัน ';
  }
  if (hours > 0) {
    formatted += '$hours ชม ';
  }
  if (minutes > 0) {
    formatted += '$minutes นาที ';
  }
  if (seconds > 0 || formatted.isEmpty) {
    // Always show seconds or show if everything else is 0
    formatted += '$seconds วินาที';
  }

  return formatted.trim();
}

List<String> getVisitorKeywordList(String keyword) {
  return keyword
      .replaceAll(",", "") // Remove all commas
      .split(" ") // Split by spaces
      .map((word) =>
          word.trim().toLowerCase()) // Trim each word and convert to lowercase
      .where((word) => word.isNotEmpty) // Remove any empty strings
      .toList();
}
