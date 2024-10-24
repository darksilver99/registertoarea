import '/component/background_view/background_view_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'authen_page_widget.dart' show AuthenPageWidget;
import 'package:flutter/material.dart';

class AuthenPageModel extends FlutterFlowModel<AuthenPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for BackgroundView component.
  late BackgroundViewModel backgroundViewModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    backgroundViewModel = createModel(context, () => BackgroundViewModel());
    passwordVisibility = false;
  }

  @override
  void dispose() {
    backgroundViewModel.dispose();
    textFieldFocusNode1?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode2?.dispose();
    passwordTextController?.dispose();
  }
}
