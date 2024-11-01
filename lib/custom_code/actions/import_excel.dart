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

import 'package:excel/excel.dart' as ex;
import 'package:register_to_area/custom_toon/custom_toon.dart';
import '/flutter_flow/custom_functions.dart' as functions;

Future<bool> importExcel(FFUploadedFile? file) async {
  // Add your function code here!
  if (file == null) {
    return false;
  }

  if (file.name!.split(".").last != "xlsx" &&
      file.name!.split(".").last != "xls") {
    return false;
  }

  var excel = ex.Excel.decodeBytes(file.bytes!);
  List<dynamic> dataList = [];
  for (int tableIndex = 0;
      tableIndex < excel.tables.keys.length;
      tableIndex++) {
    String tableName = excel.tables.keys.elementAt(tableIndex);
    var sheet = excel.tables[tableName];

    if (sheet != null) {
      int maxCols = sheet.maxColumns;
      int maxRows = sheet.rows.length;

      print("maxRows : $maxRows");
      print("maxCols : $maxCols");

      if (maxCols != 13) {
        return false;
      }

      for (int rowIndex = 1; rowIndex < maxRows; rowIndex++) {
        var row = sheet.rows[rowIndex];
        List<dynamic> rowData = [];

        for (int colIndex = 0; colIndex < maxCols; colIndex++) {
          var cellValue = colIndex < row.length ? row[colIndex]?.value : '';
          var tmp = cellValue ?? '';
          tmp = tmp.toString().replaceAll('"', '');
          rowData.add(tmp);
        }
        // List<String> zoneList = await updateZone(rowData[8]);
        dataList.add({
          "status": getStatus(rowData[0]),
          "card_no": rowData[1],
          "full_name": "${rowData[2]} ${rowData[3]}",
          "gender": getGender(rowData[4] ?? ""),
          "id_card_number": rowData[5],
          "company": rowData[6],
          "expire_date": getDateFromString(rowData[7]),
          "zone": rowData[8],
          "car_number": rowData[9],
          "type": rowData[10],
          "nationality": rowData[11],
          "address": rowData[12],
          "create_date": getCurrentTimestamp,
          "keyword_list": functions.getVisitorKeywordList(
              "${rowData[2]} ${rowData[3]} ${rowData[1]} ${rowData[5]} ${rowData[6]} ${rowData[8]} ${rowData[9]} ${rowData[10]} ${rowData[11]}"),
        });
      }

      for (final data in dataList) {
        await FirebaseFirestore.instance
            .collection(
                "${FFAppState().customerData.customerRef!.path}/visitor")
            .doc()
            .set(data);
      }
    }
  }

  return true;
}
