import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'scan_bar_code_with_web_page_widget.dart'
    show ScanBarCodeWithWebPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScanBarCodeWithWebPageModel
    extends FlutterFlowModel<ScanBarCodeWithWebPageWidget> {
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
}
