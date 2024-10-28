import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'visitor_form_view_widget.dart' show VisitorFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
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

  bool isAllZone = true;

  List<String> selectedZone = ['ทั้งหมด'];
  void addToSelectedZone(String item) => selectedZone.add(item);
  void removeFromSelectedZone(String item) => selectedZone.remove(item);
  void removeAtIndexFromSelectedZone(int index) => selectedZone.removeAt(index);
  void insertAtIndexInSelectedZone(int index, String item) =>
      selectedZone.insert(index, item);
  void updateSelectedZoneAtIndex(int index, Function(String) updateFn) =>
      selectedZone[index] = updateFn(selectedZone[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in VisitorFormView widget.
  VisitorRecord? visitorResult;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  List<String>? get choiceChipsValues => choiceChipsValueController?.value;
  set choiceChipsValues(List<String>? val) =>
      choiceChipsValueController?.value = val;
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

    companyTextfieldFocusNode?.dispose();
    companyTextfieldTextController?.dispose();

    carNumberTextfieldFocusNode?.dispose();
    carNumberTextfieldTextController?.dispose();
  }
}
