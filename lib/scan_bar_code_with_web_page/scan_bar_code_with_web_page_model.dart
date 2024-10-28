import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'scan_bar_code_with_web_page_widget.dart'
    show ScanBarCodeWithWebPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanBarCodeWithWebPageModel
    extends FlutterFlowModel<ScanBarCodeWithWebPageWidget> {
  ///  Local state fields for this page.

  List<ZoneListRecord> dataList = [];
  void addToDataList(ZoneListRecord item) => dataList.add(item);
  void removeFromDataList(ZoneListRecord item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, ZoneListRecord item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(ZoneListRecord) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - scanBarCodeWithWeb] action in ScanBarCodeWithWebPage widget.
  String? qrCode;
  // Stores action output result for [Custom Action - getVisitorDataByDocID] action in ScanBarCodeWithWebPage widget.
  VisitorRecord? visitorResult;
  // Stores action output result for [Custom Action - updateTransaction] action in ScanBarCodeWithWebPage widget.
  int? status;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future initZoneData(BuildContext context) async {
    List<ZoneListRecord>? dataListResult;

    dataListResult = await queryZoneListRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (zoneListRecord) =>
          zoneListRecord.orderBy('create_date', descending: true),
    );
    dataList = dataListResult!.toList().cast<ZoneListRecord>();
  }
}
