import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'visitor_print_view_widget.dart' show VisitorPrintViewWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisitorPrintViewModel extends FlutterFlowModel<VisitorPrintViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  bool isLoadingPrinting = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in VisitorPrintView widget.
  VisitorRecord? visitorResult;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    loadingViewModel.dispose();
  }
}
