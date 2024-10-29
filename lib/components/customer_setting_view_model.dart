import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'customer_setting_view_widget.dart' show CustomerSettingViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class CustomerSettingViewModel
    extends FlutterFlowModel<CustomerSettingViewWidget> {
  ///  Local state fields for this component.

  bool isLoading = true;

  String? imageUrl;

  List<String> tmpTypeList = [];
  void addToTmpTypeList(String item) => tmpTypeList.add(item);
  void removeFromTmpTypeList(String item) => tmpTypeList.remove(item);
  void removeAtIndexFromTmpTypeList(int index) => tmpTypeList.removeAt(index);
  void insertAtIndexInTmpTypeList(int index, String item) =>
      tmpTypeList.insert(index, item);
  void updateTmpTypeListAtIndex(int index, Function(String) updateFn) =>
      tmpTypeList[index] = updateFn(tmpTypeList[index]);

  List<String> tmpZoneList = [];
  void addToTmpZoneList(String item) => tmpZoneList.add(item);
  void removeFromTmpZoneList(String item) => tmpZoneList.remove(item);
  void removeAtIndexFromTmpZoneList(int index) => tmpZoneList.removeAt(index);
  void insertAtIndexInTmpZoneList(int index, String item) =>
      tmpZoneList.insert(index, item);
  void updateTmpZoneListAtIndex(int index, Function(String) updateFn) =>
      tmpZoneList[index] = updateFn(tmpZoneList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - tekePhotoOnWeb] action in Button widget.
  String? photoPath;
  // State field(s) for typeTextField widget.
  FocusNode? typeTextFieldFocusNode;
  TextEditingController? typeTextFieldTextController;
  String? Function(BuildContext, String?)? typeTextFieldTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  String? get choiceChipsValue1 =>
      choiceChipsValueController1?.value?.firstOrNull;
  set choiceChipsValue1(String? val) =>
      choiceChipsValueController1?.value = val != null ? [val] : [];
  // State field(s) for zoneTextField widget.
  FocusNode? zoneTextFieldFocusNode;
  TextEditingController? zoneTextFieldTextController;
  String? Function(BuildContext, String?)? zoneTextFieldTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  String? get choiceChipsValue2 =>
      choiceChipsValueController2?.value?.firstOrNull;
  set choiceChipsValue2(String? val) =>
      choiceChipsValueController2?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    typeTextFieldFocusNode?.dispose();
    typeTextFieldTextController?.dispose();

    zoneTextFieldFocusNode?.dispose();
    zoneTextFieldTextController?.dispose();
  }
}
