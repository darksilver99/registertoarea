import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'dart:html' as html;

import 'package:register_to_area/app_state.dart';
import 'package:register_to_area/flutter_flow/flutter_flow_util.dart';

bool isMobileBrowser() {
  if (kIsWeb) {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('iphone') ||
        userAgent.contains('android') ||
        userAgent.contains('ipad');
  }
  return false;
}

String getGender(String gender) {
  if (gender == "") {
    return "";
  }
  return gender.toLowerCase() == "male" ? "ชาย" : "หญิง";
}

int getStatus(String status) {
  return status.toLowerCase() == "active" ? 1 : 0;
}

DateTime? getDateFromString(String dateTime) {
  try {
    return DateTime.parse(dateTime);
  } catch (e) {
    return null;
  }
}

Future<List<String>> updateZone(String zone) async {
  try {
    List<String> listZone = zone.split(',').map((e) => e.trim()).toList();
    for (zone in listZone) {
      if (!FFAppState().tmpZone.contains(zone)) {
        final rs = await FirebaseFirestore.instance
            .collection(
                "${FFAppState().customerData.customerRef!.path}/zone_list")
            .where("subject", isEqualTo: zone)
            .get();
        FFAppState().addToTmpZone(zone);
        if (rs.size == 0) {
          FirebaseFirestore.instance
              .collection(
                  "${FFAppState().customerData.customerRef!.path}/zone_list")
              .doc()
              .set({
            "create_date": getCurrentTimestamp,
            "subject": zone,
          });
        }
      }
    }
    return listZone.contains("All zone") ? [] : listZone;
  } catch (e) {
    return [];
  }
}
