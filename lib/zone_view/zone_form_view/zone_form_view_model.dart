import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'zone_form_view_widget.dart' show ZoneFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ZoneFormViewModel extends FlutterFlowModel<ZoneFormViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in ZoneFormView widget.
  ZoneListRecord? dataResult;
  // State field(s) for subjectTextfield widget.
  FocusNode? subjectTextfieldFocusNode;
  TextEditingController? subjectTextfieldTextController;
  String? Function(BuildContext, String?)?
      subjectTextfieldTextControllerValidator;
  String? _subjectTextfieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    subjectTextfieldTextControllerValidator =
        _subjectTextfieldTextControllerValidator;
  }

  @override
  void dispose() {
    subjectTextfieldFocusNode?.dispose();
    subjectTextfieldTextController?.dispose();
  }
}
