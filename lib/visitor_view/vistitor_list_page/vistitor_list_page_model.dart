import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/loading_view/loading_view_widget.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/visitor_view/visitor_form_view/visitor_form_view_widget.dart';
import '/visitor_view/visitor_print_view/visitor_print_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'vistitor_list_page_widget.dart' show VistitorListPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VistitorListPageModel extends FlutterFlowModel<VistitorListPageWidget> {
  ///  Local state fields for this page.

  List<VisitorRecord> dataList = [];
  void addToDataList(VisitorRecord item) => dataList.add(item);
  void removeFromDataList(VisitorRecord item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, VisitorRecord item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(VisitorRecord) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - importExcel] action in Button widget.
  bool? isImport;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<VisitorRecord>();
  // Stores action output result for [Bottom Sheet - VisitorFormView] action in Column widget.
  String? isUpdate;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;

  @override
  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks.
  Future initVisitorData(BuildContext context) async {
    List<VisitorRecord>? dataListResult;

    dataListResult = await queryVisitorRecordOnce(
      parent: FFAppState().customerData.customerRef,
      queryBuilder: (visitorRecord) =>
          visitorRecord.orderBy('create_date', descending: true),
    );
    dataList = dataListResult!.toList().cast<VisitorRecord>();
  }
}
