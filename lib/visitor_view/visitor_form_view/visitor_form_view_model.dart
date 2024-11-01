import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'visitor_form_view_widget.dart' show VisitorFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class VisitorFormViewModel extends FlutterFlowModel<VisitorFormViewWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  bool isLoading = true;

  String? imageUrl;

  String? tmpCardNo;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in VisitorFormView widget.
  VisitorRecord? visitorResult;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - tekePhotoOnWeb] action in Button widget.
  String? photoPath;
  // State field(s) for fullnameTextfield widget.
  FocusNode? fullnameTextfieldFocusNode;
  TextEditingController? fullnameTextfieldTextController;
  String? Function(BuildContext, String?)?
      fullnameTextfieldTextControllerValidator;
  String? _fullnameTextfieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for idCardTextfield widget.
  FocusNode? idCardTextfieldFocusNode;
  TextEditingController? idCardTextfieldTextController;
  String? Function(BuildContext, String?)?
      idCardTextfieldTextControllerValidator;
  String? _idCardTextfieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for genderDropdown widget.
  String? genderDropdownValue;
  FormFieldController<String>? genderDropdownValueController;
  // State field(s) for nationalityTextfield widget.
  FocusNode? nationalityTextfieldFocusNode;
  TextEditingController? nationalityTextfieldTextController;
  String? Function(BuildContext, String?)?
      nationalityTextfieldTextControllerValidator;
  // State field(s) for addressTextfield widget.
  FocusNode? addressTextfieldFocusNode;
  TextEditingController? addressTextfieldTextController;
  String? Function(BuildContext, String?)?
      addressTextfieldTextControllerValidator;
  // State field(s) for companyTextfield widget.
  FocusNode? companyTextfieldFocusNode;
  TextEditingController? companyTextfieldTextController;
  String? Function(BuildContext, String?)?
      companyTextfieldTextControllerValidator;
  String? _companyTextfieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for carNumberTextfield widget.
  FocusNode? carNumberTextfieldFocusNode;
  TextEditingController? carNumberTextfieldTextController;
  String? Function(BuildContext, String?)?
      carNumberTextfieldTextControllerValidator;
  String? _carNumberTextfieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for typeDropdown widget.
  String? typeDropdownValue;
  FormFieldController<String>? typeDropdownValueController;
  // State field(s) for zoneDropdown widget.
  String? zoneDropdownValue;
  FormFieldController<String>? zoneDropdownValueController;
  // State field(s) for statusDropdown widget.
  String? statusDropdownValue;
  FormFieldController<String>? statusDropdownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  VisitorRecord? lastVisitorResult;

  @override
  void initState(BuildContext context) {
    fullnameTextfieldTextControllerValidator =
        _fullnameTextfieldTextControllerValidator;
    idCardTextfieldTextControllerValidator =
        _idCardTextfieldTextControllerValidator;
    companyTextfieldTextControllerValidator =
        _companyTextfieldTextControllerValidator;
    carNumberTextfieldTextControllerValidator =
        _carNumberTextfieldTextControllerValidator;
  }

  @override
  void dispose() {
    fullnameTextfieldFocusNode?.dispose();
    fullnameTextfieldTextController?.dispose();

    idCardTextfieldFocusNode?.dispose();
    idCardTextfieldTextController?.dispose();

    nationalityTextfieldFocusNode?.dispose();
    nationalityTextfieldTextController?.dispose();

    addressTextfieldFocusNode?.dispose();
    addressTextfieldTextController?.dispose();

    companyTextfieldFocusNode?.dispose();
    companyTextfieldTextController?.dispose();

    carNumberTextfieldFocusNode?.dispose();
    carNumberTextfieldTextController?.dispose();
  }
}
